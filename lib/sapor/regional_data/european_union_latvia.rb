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
  # The regional data for the European Union: Latvia.
  #
  class EuropeanUnionLatvia < Area
    include Singleton

    def area_code
      'EU[LV]'
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

    COALITIONS = [['Latvijas attīstībai (ALDE)',
                   'Zaļo un Zemnieku savienība (ALDE)'],
                  ['Latvijas Krievu savienība (Greens/EFA)'],
                  ['Jaunā konservatīvā partija (*)', 'Kam pieder valsts? (*)',
                   'Kustība Par! (*)', 'Latvijas Reģionu apvienība (*)',
                   'No sirds Latvijai (*)', 'Vienoti Latvijai (*)'],
                  ['Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un ' \
                     'Brīvībai/LNNK” (ECR)'],
                  ['Sociāldemokrātiskā Partija “Saskaņa” (S&D)'],
                  ['Vienotība (EPP)']].freeze

    NO_OF_SEATS = 8

    # Voter turnout on 24 May 2014
    # Source: Web page with the official results of the elections of 24 May
    # 2014, downloaded on 13 April 2018,
    # https://en.wikipedia.org/wiki/European_Parliament_election,_2014_(Latvia)
    POPULATION_SIZE = 440_288

    THRESHOLD = 0.05

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(
          NO_OF_SEATS, SainteLagueDenominators, THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
