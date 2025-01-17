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
  # The regional data for the European Union 27: Estonia.
  #
  class EuropeanUnion27Estonia < Area
    include Singleton

    def area_code
      'EU27[EE]'
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

    COALITIONS = [['Eesti 200 (RE)', 'Eesti Keskerakond (RE)',
                   'Eesti Reformierakond (RE)',
                   'Raimond Kaljulaid (RE)'],
                  ['Eesti Konservatiivne Rahvaerakond (ID)'],
                  ['Eesti Vabaerakond (*)'],
                  ['Erakond Eestimaa Rohelised (Greens/EFA)'],
                  ['Erakond Isamaa (EPP)'],
                  ['Sotsiaaldemokraatlik Erakond (S&D)']].freeze

    NO_OF_SEATS = 7

    # Voter turnout on 26 May 2019
    # Source: Web page with the official results of the elections of 26 May
    # 2019, downloaded on 10 June 2019,
    # https://de.wikipedia.org/wiki/Europawahl_in_Estland_2019
    POPULATION_SIZE = 332_859

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(NO_OF_SEATS, \
                                                           DhondtDenominators)
      end
      @electoral_system
    end
  end
end
