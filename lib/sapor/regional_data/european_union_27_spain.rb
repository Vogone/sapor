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
  # The regional data for the European Union 27: Spain.
  #
  class EuropeanUnion27Spain < Area
    include Singleton

    def area_code
      'EU27[ES]'
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

    COALITIONS = [['Ahora Repúblicas (Greens/EFA)',
                   'Bloque Nacionalista Galego–Nós Candidatura Galega (Greens/EFA)',
                   'Coalició Compromís (Greens/EFA)',
                   'Esquerra Republicana de Catalunya–Catalunya Sí (Greens/EFA)',
                   'Primavera Europea (Greens/EFA)'],
                  ['Ciudadanos–Partido de la Ciudadanía (RE)',
                   'Coalición Canaria–Partido Nacionalista Canario (RE)',
                   'Coalición por Europa (RE)',
                   'Euzko Alderdi Jeltzalea/Partido Nacionalista Vasco (RE)'],
                  ['Euskal Herria Bildu (GUE/NGL)',
                   'Partido Animalista Contra el Maltrato Animal (GUE/NGL)',
                   'Unidos Podemos (GUE/NGL)'],
                  ['Partido Popular (EPP)'],
                  ['Partido Socialista Obrero Español (S&D)'],
                  ['Partit Demòcrata Europeu Català (NI)'],
                  ['Vox (ECR)']].freeze

    NO_OF_SEATS = 59

    # Voter turnout on 26 May 2019
    # Source: Web page with the official results of the elections of 26 May
    # 2019, downloaded on 10 June 2019,
    # https://en.wikipedia.org/wiki/2019_European_Parliament_election_in_Spain
    POPULATION_SIZE = 22_410_049

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(NO_OF_SEATS, \
                                                           DhondtDenominators)
      end
      @electoral_system
    end
  end
end
