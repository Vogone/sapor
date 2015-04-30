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

describe Sapor::Norway, '#seats' do
  it 'calculates the number of seats for the election of 2013 correctly' do
    seats = Sapor::Norway.instance.seats(Sapor::Norway::LAST_ELECTION_RESULT) 
    expect(seats['Arbeiderpartiet']).to eq(55)
    expect(seats['Høyre']).to eq(48)
    expect(seats['Fremskrittspartiet']).to eq(29)
    expect(seats['Kristelig Folkeparti']).to eq(10)
    expect(seats['Senterpartiet']).to eq(10)
    expect(seats['Venstre']).to eq(9)
    expect(seats['Sosialistisk Venstreparti']).to eq(7)
    expect(seats['Miljøpartiet de Grønne']).to eq(1)
    expect(seats['Rødt']).to eq(0)
    expect(seats['De Kristne']).to eq(0)
# TODO:   expect(seats['Pensjonistpartiet']).to eq(0)
  end
end

# TODO: Sanity check that LAST_DETAILED_ELECTION_RESULT sums up to LAST_ELECTION_RESULT
 