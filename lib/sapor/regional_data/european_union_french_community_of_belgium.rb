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
  # The regional data for the European Union: the French-speaking part.
  #
  class EuropeanUnionFrenchCommunityOfBelgium < Area
    include Singleton

    def area_code
      'EU[BE-FRC]'
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

    COALITIONS = [['Centre démocrate humaniste (EPP)'],
                  ['Debout les Belges (*)', 'La Droite (*)', 'FW (*)',
                   'ISLAM (*)', 'Parti Populaire (*)', 'R.W.F. (*)',
                   'Wallonie d’Abord (*)'],
                  ['DéFI (RE)', 'Mouvement Réformateur (RE)'],
                  ['Ecolo (Greens/EFA)', 'PIRATE (Greens/EFA)'],
                  ['Parti Socialiste (S&D)'],
                  ['Parti du Travail de Belgique (GUE/NGL)']].freeze

    NO_OF_SEATS = 8

    # Voter turnout on 26 May 2019
    # Source: Web page with the official results of the elections of 26 May
    # 2019, downloaded on 24 September 2019,
    # https://verkiezingen2019.belgium.be/nl/resultaten-cijfers?el=EU&id=EUL92094
    POPULATION_SIZE = 2_439_775

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(NO_OF_SEATS, \
                                                           DhondtDenominators)
      end
      @electoral_system
    end
  end
end
