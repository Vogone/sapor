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

describe Sapor::Luxembourg, '#area_code' do
  it 'returns LU as the area code' do
    expect(Sapor::Luxembourg.instance.area_code).to eq('LU')
  end
end

describe Sapor::Luxembourg, '#no_of_seats' do
  it 'returns 60 as the number of seats' do
    expect(Sapor::Luxembourg.instance.no_of_seats).to eq(60)
  end
end

describe Sapor::Luxembourg, '#population_size' do
  it 'returns a population size of 3,276,692' do
    expect(Sapor::Luxembourg.instance.population_size).to eq(3_276_692)
  end
end

describe Sapor::Luxembourg, '#seats' do
  it 'calculates the number of seats for the election of 2013 correctly' do
    Luxembourg = Sapor::Luxembourg.instance
    results = Luxembourg.overall_election_results_of_2013
    seats = Luxembourg.seats(results)
    expect(seats['Chrëschtlech-Sozial Vollekspartei']).to eq(23)
    expect(seats['Lëtzebuerger Sozialistesch Aarbechterpartei']).to eq(13)
    expect(seats['Demokratesch Partei']).to eq(13)
    expect(seats['déi gréng']).to eq(6)
    expect(seats['Alternativ Demokratesch Reformpartei']).to eq(3)
    expect(seats['Déi Lénk']).to eq(2)
    expect(seats['Piratepartei Lëtzebuerg']).to eq(0)
    expect(seats['Kommunistesch Partei Lëtzebuerg']).to eq(0)
    expect(seats['Partei fir Integral Demokratie']).to eq(0)
  end
end
