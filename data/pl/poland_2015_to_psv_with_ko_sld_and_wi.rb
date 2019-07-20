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

SOURCE = '2015-gl-lis-okr.csv'.freeze
TARGET = '../../lib/sapor/regional_data/poland-20151025-with-ko-sld-and-wi-without-n-po-and-zl.psv'.freeze

N_PARTY = '.Nowoczesna'.freeze
PO_PARTY = 'Platforma Obywatelska'.freeze
ZL_PARTY = 'Zjednoczona Lewica'.freeze
PARTIES = ['Prawo i Sprawiedliwość',
           PO_PARTY,
           'Lewica Razem', 
           'KORWiN',
           'Polskie Stronnictwo Ludowe',
           ZL_PARTY,
           'Kukiz’15',
           N_PARTY,
           'JOW Bezpartyjni',
           'Stonoga Partia Polska',
           'Ruch Społeczny Rzeczypospolitej Polskiej',
           'Zjednoczeni dla Śląska',
           'Samoobrona',
           'Grzegorz Braun „Szczęść Boże!”',
           'Kongres Nowej Prawicy',
           'Mniejszość Niemiecka',
           'Obywatele do Parlamentu']

File.open(TARGET, 'w') do |output|
  output.puts '# Statistical Analysis of Polling Results (SAPoR)'
  output.puts '# Copyright (C) 2016 Filip van Laenen <f.a.vanlaenen@ieee.org>'
  output.puts '#'
  output.puts '# This file is part of SAPoR.'
  output.puts '#'
  output.puts '# SAPoR is free software: you can redistribute it and/or' \
              ' modify it under the'
  output.puts '# terms of the GNU General Public License as published by the' \
              ' Free Software'
  output.puts '# Foundation, either version 3 of the License, or (at your' \
              ' option) any later'
  output.puts '# version.'
  output.puts '#'
  output.puts '# SAPoR is distributed in the hope that it will be useful, but' \
              ' WITHOUT ANY'
  output.puts '# WARRANTY; without even the implied warranty of' \
              ' MERCHANTABILITY or FITNESS FOR'
  output.puts '# A PARTICULAR PURPOSE.  See the GNU General Public License' \
              ' for more details.'
  output.puts '#'
  output.puts '# You can find a copy of the GNU General Public License in' \
              ' /doc/gpl.txt'
  output.puts '#'
  File.open(SOURCE).each do |line|
    next if line.chomp.start_with?('Siedziba OKW')
    if line.chomp.empty?
      output.puts
    else
      elements = line.chomp.split(',').map(&:strip)
      district = elements[0]
      ko_no = 0
      PARTIES.each_with_index do |p, i|
        unless elements[i+1].nil? || elements[i+1].empty?
          votes = elements[i+1].delete('.')
          if p == ZL_PARTY
            output.puts "#{district} | Sojusz Lewicy Demokratycznej | #{votes}"
            output.puts "#{district} | Wiosna | #{votes}"
          elsif p == PO_PARTY || p == N_PARTY
            ko_no += votes.to_i
          else
            output.puts "#{district} | #{p} | #{votes}"
          end
        end
      end
      output.puts "#{district} | Koalicja Obywatelska | #{ko_no}"
    end
  end
end
