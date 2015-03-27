# encoding: utf-8
#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2014 Filip van Laenen <f.a.vanlaenen@ieee.org>
#
# This file is part of SAPoR.
#
# SAPoR is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# SAPoR is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You can find a copy of the GNU General Public License in /doc/gpl.txt
#

require 'prime'

module Sapor
  #
  # Represents a polychotomy.
  #
  class Polychotomy
    include NumberFormatter

    attr_reader :error_estimate, :no_of_data_points, :no_of_simulations

    def initialize(results, population_size, dichotomies, max_error)
      @results = results
      @population_size = population_size
      @choices = results.keys
      @ranges = extract_ranges_from_dichotomies(dichotomies, max_error)
      @enum = PseudoRandomMultiRangeEnumerator.new(@ranges.values.map{|a| a.size}).each
      @no_of_simulations = 0
      @no_of_data_points = 0
      @distributions = create_new_distributions
      @error_estimate = 1.0
    end

    def range(choice)
      @ranges[choice]
    end

    def space_size
      @enum.size
    end

    def most_probable_value(choice)
      if @no_of_simulations == 0
        nil
      else
        @distributions[choice].most_probable_value
      end
    end

    def calculate_most_probable_fraction(choice, distributions)
      # TODO: Should rather aggregate per intervals of max_error
      distributions[choice].most_probable_value.to_f / @population_size
    end

    def most_probable_fraction(choice)
      if @no_of_simulations == 0
        nil
      else
        calculate_most_probable_fraction(choice, @distributions)
      end
    end

    def refine
      no_of_new_simulations = 0
      new_distributions = create_new_distributions
      while @no_of_data_points == 0 || no_of_new_simulations == 0 ||
            no_of_new_simulations < @no_of_simulations
        data_point = next_data_point
        if data_point[OTHER] >= 0
          simulate(new_distributions, data_point)
          no_of_new_simulations += 1
        end
        @no_of_data_points += 1
      end
      unless @no_of_simulations == 0
        @error_estimate = calculate_error_estimate(new_distributions)
      end
      @distributions = merge_distributions(@distributions, new_distributions)
      @no_of_simulations += no_of_new_simulations
    end

    def report
      choice_lengths = @choices.map { | choice | choice.length }
      choice_lengths << 6
      max_choice_width = choice_lengths.max
      sorted_choices = sort_choices_by_mpv
      lines = sorted_choices.map do | choice |
        create_report_line(choice, max_choice_width)
      end
      "Most probable fractions and 95% confidence intervals:\n" +
      'Choice'.ljust(max_choice_width) + "    MPF      CI(95%)\n" +
      lines.join("\n")
    end

    def progress_report
      space_size_ratio = space_size / @no_of_data_points
      if space_size_ratio > 10
        space_size_ratio = with_thousands_separator(space_size_ratio.round)
      else
        space_size_ratio = space_size_ratio.round(1)
      end
      "#{with_thousands_separator(@no_of_simulations)} simulations out of " +
      "#{with_thousands_separator(@no_of_data_points)} data" +
      " points, 1 / #{space_size_ratio} of search space size" +
      " (#{with_thousands_separator(space_size)})."
    end

    private

    def extract_ranges_from_dichotomies(dichotomies, max_error)
      ranges = {}
      level = 1 - (max_error**2)
      @choices.each do | choice |
        unless choice == OTHER
          ranges[choice] = dichotomies.confidence_interval_values(choice,
                                                                  level).sort
        end
      end
      ranges
    end

    def create_new_distributions
      distributions = {}
      @choices.each do | choice |
        unless choice == OTHER
          distributions[choice] = CombinationsDistribution.new
          @ranges[choice].each do | value |
            distributions[choice][value] = 0.to_lf
          end
        end
      end
      distributions
    end

    def next_data_point
      indexes = @enum.next
      data_point = {}
      indexes.each_with_index do | ix, i |
        data_point[@ranges.keys[i]] = @ranges.values[i][ix]
      end
      data_point[OTHER] = @population_size - data_point.values.inject(:+)
      data_point
    end

    def simulate(distributions, data_point)
      combinations = 1.to_lf
      data_point.each do | choice, value |
        combinations *= value.large_float_binomial_by_product_of_divisions(@results[choice])
      end
      data_point.each do | choice, value |
        unless choice == OTHER
          distributions[choice][value] += combinations
        end
      end
    end

    def calculate_error_estimate(new_simulations)
      error_estimate = 0
      @choices.each do | choice |
        unless choice == OTHER
          delta = (calculate_most_probable_fraction(choice, new_simulations) - calculate_most_probable_fraction(choice, @distributions)).abs
          error_estimate = [error_estimate, delta].max
        end
      end
      error_estimate
    end

    # TODO: This should be moved to CombinationsDistribution as +
    def merge_distributions(distributions1, distributions2)
      merged_distributions = {}
      @choices.each do | choice |
        unless choice == OTHER
          merged_distributions[choice] = CombinationsDistribution.new
          @ranges[choice].each do | value |
            merged_distributions[choice][value] = distributions1[choice][value] + distributions2[choice][value]
          end
        end
      end
      merged_distributions
    end

    def sort_choices_by_mpv
      sorted_choices = @choices.reject { | choice | choice == OTHER }
      sorted_choices.sort do | a, b |
        mpv_a = most_probable_fraction(a)
        mpv_b = most_probable_fraction(b)
        mpv_b <=> mpv_a
      end
    end

    def create_report_line(choice, max_choice_width)
      confidence_interval = @distributions[choice].confidence_interval(0.95).map { | x | x.to_f / @population_size }
      choice.ljust(max_choice_width) + '  ' + \
      six_char_percentage(most_probable_fraction(choice)) + '  ' + \
      six_char_percentage(confidence_interval.first) + '–' + \
      six_char_percentage(confidence_interval.last)
    end
  end
end
