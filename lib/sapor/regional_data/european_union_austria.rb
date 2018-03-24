# encoding: utf-8
#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2016 Filip van Laenen <f.a.vanlaenen@ieee.org>
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

module Sapor
  #
  # The regional data for the European Union: Austria.
  #
  class EuropeanUnionAustria < Area
    include Singleton

    def area_code
      'EU[AT]'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      NO_OF_SEATS
    end

    def population_size
      POPULATION_SIZE
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    private

    COALITIONS = [['Die Grünen–Die Grüne Alternative (Greens/EFA)'],
                  ['Freiheitliche Partei Österreichs (ENF)'],
                  ['Liste Peter Pilz (—)', 'Meine Stimme Gilt! (—)'],
                  ['NEOS–Das Neue Österreich und Liberales Forum (ALDE)'],
                  ['Österreichische Volkspartei (EPP)'],
                  ['Sozialdemokratische Partei Österreichs (S&D)']].freeze

    NO_OF_SEATS = 18

    # Voter turnout on 25 May 2014
    # Source: Web page with the official results of the elections of 25 May
    # 2014, downloaded on 8 March 2018,
    # https://en.wikipedia.org/wiki/European_Parliament_election,_2014_(Austria)
    POPULATION_SIZE = 2_823_561

    THRESHOLD = 0.04

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(NO_OF_SEATS,
                                                           DhondtDenominators,
                                                           THRESHOLD)
      end
      @electoral_system
    end
  end
end