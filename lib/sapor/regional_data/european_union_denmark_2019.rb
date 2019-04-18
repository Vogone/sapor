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
  # The regional data for the European Union: Denmark, adjusted for the 2019
  # elections.
  #
  class EuropeanUnionDenmark2019 < Area
    include Singleton

    def area_code
      'EU[DK]@2019'
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

    COALITIONS = [['Alternativet (Greens/EFA)',
                   'Socialistisk Folkeparti (Greens/EFA)'],
                  ['Dansk Folkeparti (EAPN)'],
                  ['Det Konservative Folkeparti (EPP)',
                   'Kristendemokraterne (EPP)'],
                  ['Enhedslisten–De Rød-Grønne (GUE/NGL)'],
                  ['Klaus Riskær Pedersen (*)', 'Nye Borgerlige (*)'],
                  ['Liberal Alliance (ALDE)', 'Radikale Venstre (ALDE)',
                   'Venstre (ALDE)'],
                  ['Socialdemokraterne (S&D)']].freeze

    NO_OF_SEATS = 14

    # Voter turnout on 25 May 2014
    # Source: Web page with the official results of the elections of 25 May
    # 2014, downloaded on 17 March 2018,
    # https://en.wikipedia.org/wiki/European_Parliament_election,_2014_(Denmark)
    POPULATION_SIZE = 2_273_018

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(NO_OF_SEATS, \
                                                           DhondtDenominators)
      end
      @electoral_system
    end
  end
end
