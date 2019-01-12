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

require 'spec_helper'

describe Sapor::PortugalWithAWithoutPaf, '#area_code' do
  it 'returns PT∪{A}\{PàF} as the area code' do
    expect(Sapor::PortugalWithAWithoutPaf.instance.area_code).to \
      eq('PT∪{A}\{PàF}')
  end
end

describe Sapor::PortugalWithAWithoutPaf, '#no_of_seats' do
  it 'returns 230 as the number of seats' do
    expect(Sapor::PortugalWithAWithoutPaf.instance.no_of_seats).to eq(230)
  end
end

describe Sapor::PortugalWithAWithoutPaf, '#population_size' do
  it 'returns a population size of 5,206,113' do
    expect(Sapor::PortugalWithAWithoutPaf.instance.population_size).to eq(5_206_113)
  end
end

describe Sapor::PortugalWithAWithoutPaf, '#seats' do
  it 'calculates the number of seats for the election of 2015 adjusted for' \
     ' the seat distribution for 2019' do
    PortugalWithAWithoutPaf = Sapor::PortugalWithAWithoutPaf.instance
    results = PortugalWithAWithoutPaf.overall_election_results_of_2015
    seats = Sapor::PortugalWithAWithoutPaf.instance.seats(results)
    expect(seats['Partido Social Democrata']).to eq(5 + 60)
    expect(seats['Aliança']).to eq(0 + 56)
    expect(seats['CDS–Partido Popular']).to eq(0 + 47)
    expect(seats['Partido Socialista']).to eq(86 - 40)
    expect(seats['Bloco de Esquerda']).to eq(19 - 10)
    expect(seats['Coligação Democrática Unitária']).to eq(17 - 10)
    expect(seats['Pessoas–Animais–Natureza']).to eq(1 - 1)
    expect(seats['Partido Democrático Republicano']).to eq(0)
    expect(seats['Partido Comunista dos Trabalhadores Portugueses']).to eq(0)
    expect(seats['LIVRE/Tempo de Avançar']).to eq(0)
    expect(seats['Partido Nacional Renovador']).to eq(0)
    expect(seats['Partido da Terra']).to eq(0)
    expect(seats['AGIR']).to eq(0)
    expect(seats['Partido Trabalhista Português']).to eq(0)
    expect(seats['Nós, Cidadãos!']).to eq(0)
    expect(seats['Partido Popular Monárquico']).to eq(0)
    expect(seats['Juntos pelo Povo']).to eq(0)
    expect(seats['Partido Unido dos Reformados e Pensionistas']).to eq(0)
    expect(seats['Aliança Açores']).to eq(0)
    expect(seats['Partido Cidadania e Democracia Cristã']).to eq(0)
  end
end
