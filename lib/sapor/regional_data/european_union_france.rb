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
  # The regional data for the European Union: France.
  #
  class EuropeanUnionFrance < Area
    include Singleton

    def area_code
      'EU[FR]'
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

    COALITIONS = [['Agir, la droite constructive–Union des démocrates et' \
                   ' indépendants (ALDE)',
                   'La République en marche–Mouvement démocrate (ALDE)'],
                  ['Debout la France (EFDD)', 'Les Patriotes (EFDD)'],
                  ['Europe Écologie Les Verts (Greens/EFA)'],
                  ['Front national (ENF)'],
                  ['La France insoumise (GUE/NGL)',
                   'Parti communiste français (GUE/NGL)'],
                  ['Les Républicains (EPP)'],
                  ['Parti socialiste (S&D)'],
                  ['Union populaire républicaine (—)']].freeze

    NO_OF_SEATS = 74

    # Voter turnout on 25 May 2014
    # Source: Web page with the official results of the elections of 25 May
    # 2014, downloaded on 8 February 2018,
    # https://en.wikipedia.org/wiki/European_Parliament_election,_2014_(France)
    POPULATION_SIZE = 18_955_636

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(NO_OF_SEATS,
                                                           DhondtDenominators)
      end
      @electoral_system
    end
  end
end