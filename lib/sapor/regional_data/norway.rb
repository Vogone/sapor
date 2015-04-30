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

module Sapor
  #
  # The regional data for Norway.
  #
  class Norway
    include Singleton

    # Source: NSD European Election Database, Parliamentary election of 2013,\
    # retrieved on 14 April 2015.
    # URL: http://eed.nsd.uib.no/webview/index.jsp?stubs=nuts_id&study=http%3A%2F%2F129.177.90.166%3A80%2Fobj%2FfStudy%2Fnopa2013&virtualslice=pv_p_value&measuretype=4&headers=party_name_org&mode=cube&v=2&party_name_orgsubset=1+-+9&cube=http%3A%2F%2F129.177.90.166%3A80%2Fobj%2FfCube%2Fnopa2013_C1&nuts_idsubset=NO%2CNO011+-+NO073&virtualsubset=pv_p_value&layers=virtual&measure=common&top=yes
    LAST_ELECTION_RESULT = { 'Arbeiderpartiet' => 874_769,
                             'Høyre' => 760_232,
                             'Fremskrittspartiet' => 463_560,
                             'Kristelig Folkeparti' => 158_475,
                             'Senterpartiet' => 155_357,
                             'Venstre' => 148_275,
                             'Sosialistisk Venstreparti' => 116_021,
                             'Miljøpartiet de Grønne' => 79_152,
                             'Rødt' => 30_751,
                             'De Kristne' => 17_731,

    # Source: NSD European Election Database, Parliamentary election of 2013,
    # retrieved on 14 April 2015.
    # URL: http://eed.nsd.uib.no/webview/index.jsp?stubs=nuts_id&study=http%3A%2F%2F129.177.90.166%3A80%2Fobj%2FfStudy%2Fnopa2013&virtualslice=pv_p_value&measuretype=4&headers=party_name_org&mode=cube&v=2&party_name_orgsubset=1+-+9&cube=http%3A%2F%2F129.177.90.166%3A80%2Fobj%2FfCube%2Fnopa2013_C1&nuts_idsubset=NO%2CNO011+-+NO073&virtualsubset=pv_p_value&layers=virtual&measure=common&top=yes
    LAST_DETAILED_ELECTION_RESULT = {
      'Akershus' => { 'Arbeiderpartiet' => 91_364,
                      'Høyre' => 108_860,
                      'Fremskrittspartiet' => 54_658,
                      'Kristelig Folkeparti' => 10_377,
                      'Senterpartiet' => 8_111,
                      'Venstre' => 20_217,
                      'Sosialistisk Venstreparti' => 11_305,
                      'Miljøpartiet de Grønne' => 9_804,
                      'Rødt' => 2_365,
                      'De Kristne' => 792,
      'Aust-Agder' => { 'Arbeiderpartiet' => 17_623,
                        'Høyre' => 16_303,
                        'Fremskrittspartiet' => 11_278,
                        'Kristelig Folkeparti' => 7_019,
                        'Senterpartiet' => 2_815,
                        'Venstre' => 3_033,
                        'Sosialistisk Venstreparti' => 1_652,
                        'Miljøpartiet de Grønne' => 1_242,
                        'Rødt' => 345,
                        'De Kristne' => 862,
      'Buskerud' => { 'Arbeiderpartiet' => 47_572,
                      'Høyre' => 43_515,
                      'Fremskrittspartiet' => 27_854,
                      'Kristelig Folkeparti' => 4_863,
                      'Senterpartiet' => 9_110,
                      'Venstre' => 6_913,
                      'Sosialistisk Venstreparti' => 4_094,
                      'Miljøpartiet de Grønne' => 3_345,
                      'Rødt' => 905,
                      'De Kristne' => 736,
      'Finnmark' => { 'Arbeiderpartiet' => 15_003,
                      'Høyre' => 8_032,
                      'Fremskrittspartiet' => 6_038,
                      'Kristelig Folkeparti' => 1_117,
                      'Senterpartiet' => 1_403,
                      'Venstre' => 1_359,
                      'Sosialistisk Venstreparti' => 1_952,
                      'Miljøpartiet de Grønne' => 844,
                      'Rødt' => 351,
                      'De Kristne' => 335,
      'Hedmark' => { 'Arbeiderpartiet' => 48_694,
                     'Høyre' => 20_600,
                     'Fremskrittspartiet' => 15_316,
                     'Kristelig Folkeparti' => 2_871,
                     'Senterpartiet' => 11_483,
                     'Venstre' => 3_805,
                     'Sosialistisk Venstreparti' => 4_393,
                     'Miljøpartiet de Grønne' => 2_224,
                     'Rødt' => 773,
                     'De Kristne' => 414,
      'Hordaland' => { 'Arbeiderpartiet' => 71_216,
                       'Høyre' => 89_682,
                       'Fremskrittspartiet' => 43_357,
                       'Kristelig Folkeparti' => 22_114,
                       'Senterpartiet' => 12_490,
                       'Venstre' => 16_614,
                       'Sosialistisk Venstreparti' => 14_143,
                       'Miljøpartiet de Grønne' => 9_171,
                       'Rødt' => 2_687,
                       'De Kristne' => 2_422,
      'Møre og Romsdal' => { 'Arbeiderpartiet' => 36_048,
                             'Høyre' => 37_594,
                             'Fremskrittspartiet' => 28_746,
                             'Kristelig Folkeparti' => 12_786,
                             'Senterpartiet' => 11_749,
                             'Venstre' => 7_965,
                             'Sosialistisk Venstreparti' => 3_532,
                             'Miljøpartiet de Grønne' => 1_963,
                             'Rødt' => 642,
                             'De Kristne' => 1_534,
      'Nord-Trøndelag' => { 'Arbeiderpartiet' => 32_054,
                            'Høyre' => 11_128,
                            'Fremskrittspartiet' => 9_869,
                            'Kristelig Folkeparti' => 2_707,
                            'Senterpartiet' => 12_796,
                            'Venstre' => 3_158,
                            'Sosialistisk Venstreparti' => 2_596,
                            'Miljøpartiet de Grønne' => 1_051,
                            'Rødt' => 423,
                            'De Kristne' => 283,
      'Nordland' => { 'Arbeiderpartiet' => 46_743,
                      'Høyre' => 28_271,
                      'Fremskrittspartiet' => 25_020,
                      'Kristelig Folkeparti' => 4_886,
                      'Senterpartiet' => 9_237,
                      'Venstre' => 4_938,
                      'Sosialistisk Venstreparti' => 6_907,
                      'Miljøpartiet de Grønne' => 2_653,
                      'Rødt' => 2_164,
                      'De Kristne' => 698,
      'Oppland' => { 'Arbeiderpartiet' => 44_050,
                     'Høyre' => 20_537,
                     'Fremskrittspartiet' => 13_683,
                     'Kristelig Folkeparti' => 3_418,
                     'Senterpartiet' => 13_162,
                     'Venstre' => 4_248,
                     'Sosialistisk Venstreparti' => 3_165,
                     'Miljøpartiet de Grønne' => 2_583,
                     'Rødt' => 817,
                     'De Kristne' => 460,
      'Oslo' => { 'Arbeiderpartiet' => 106_001,
                  'Høyre' => 103_834,
                  'Fremskrittspartiet' => 40_660,
                  'Kristelig Folkeparti' => 9_850,
                  'Senterpartiet' => 2_963,
                  'Venstre' => 28_619,
                  'Sosialistisk Venstreparti' => 21_924,
                  'Miljøpartiet de Grønne' => 19_356,
                  'Rødt' => 11_133,
                  'De Kristne' => 734,
      'Rogaland' => { 'Arbeiderpartiet' => 54_462,
                      'Høyre' => 72_470,
                      'Fremskrittspartiet' => 45_082,
                      'Kristelig Folkeparti' => 25_585,
                      'Senterpartiet' => 12_621,
                      'Venstre' => 10_827,
                      'Sosialistisk Venstreparti' => 7_908,
                      'Miljøpartiet de Grønne' => 5_267,
                      'Rødt' => 1_060,
                      'De Kristne' => 2_296,
      'Sogn og Fjordane' => { 'Arbeiderpartiet' => 17_183,
                              'Høyre' => 11_635,
                              'Fremskrittspartiet' => 6_608,
                              'Kristelig Folkeparti' => 4_952,
                              'Senterpartiet' => 12_619,
                              'Venstre' => 3_883,
                              'Sosialistisk Venstreparti' => 2_076,
                              'Miljøpartiet de Grønne' => 1_032,
                              'Rødt' => 386,
                              'De Kristne' => 515,
      'Sør-Trøndelag' => { 'Arbeiderpartiet' => 64_351,
                           'Høyre' => 38_930,
                           'Fremskrittspartiet' => 23_871,
                           'Kristelig Folkeparti' => 6_562,
                           'Senterpartiet' => 11_351,
                           'Venstre' => 9_460,
                           'Sosialistisk Venstreparti' => 9_992,
                           'Miljøpartiet de Grønne' => 5_540,
                           'Rødt' => 1_667,
                           'De Kristne' => 522,
      'Telemark' => { 'Arbeiderpartiet' => 35_963,
                      'Høyre' => 21_300,
                      'Fremskrittspartiet' => 18_564,
                      'Kristelig Folkeparti' => 6_610,
                      'Senterpartiet' => 4_360,
                      'Venstre' => 3_393,
                      'Sosialistisk Venstreparti' => 3_192,
                      'Miljøpartiet de Grønne' => 2_116,
                      'Rødt' => 884,
                      'De Kristne' => 1_017,
      'Troms' => { 'Arbeiderpartiet' => 27_436,
                   'Høyre' => 19_663,
                   'Fremskrittspartiet' => 17_315,
                   'Kristelig Folkeparti' => 3_659,
                   'Senterpartiet' => 5_636,
                   'Venstre' => 3_687,
                   'Sosialistisk Venstreparti' => 5_688,
                   'Miljøpartiet de Grønne' => 2_190,
                   'Rødt' => 1_608,
                   'De Kristne' => 322,
      'Vest-Agder' => { 'Arbeiderpartiet' => 23_227,
                        'Høyre' => 26_818,
                        'Fremskrittspartiet' => 17_863,
                        'Kristelig Folkeparti' => 13_536,
                        'Senterpartiet' => 2_962,
                        'Venstre' => 4_205,
                        'Sosialistisk Venstreparti' => 2_568,
                        'Miljøpartiet de Grønne' => 2_196,
                        'Rødt' => 460,
                        'De Kristne' => 1_975,
      'Vestfold' => { 'Arbeiderpartiet' => 40_869,
                      'Høyre' => 41_357,
                      'Fremskrittspartiet' => 26_977,
                      'Kristelig Folkeparti' => 6_735,
                      'Senterpartiet' => 4_084,
                      'Venstre' => 6_228,
                      'Sosialistisk Venstreparti' => 5_266,
                      'Miljøpartiet de Grønne' => 3_407,
                      'Rødt' => 932,
                      'De Kristne' => 691,
      'Østfold' => { 'Arbeiderpartiet' => 54_910,
                     'Høyre' => 39_703,
                     'Fremskrittspartiet' => 30_801,
                     'Kristelig Folkeparti' => 8_828,
                     'Senterpartiet' => 6_405,
                     'Venstre' => 5_723,
                     'Sosialistisk Venstreparti' => 3_668,
                     'Miljøpartiet de Grønne' => 3_168,
                     'Rødt' => 1_149,
                     'De Kristne' => 1_123,

    # Source: Valg i Norge, Valgkretser, Wikipedia, retrieved on 16 April 2015.
    # URL: http://no.wikipedia.org/wiki/Valg_i_Norge#Valgkretser
    DIRECT_SEAT_DISTRIBUTION = { 'Akershus' => 18,
                                 'Aust-Agder' => 3,
                                 'Buskerud' => 8,
                                 'Finnmark' => 1,
                                 'Hedmark' => 6,
                                 'Hordaland' => 16,
                                 'Møre og Romsdal' => 8,
                                 'Nord-Trøndelag' => 3,
                                 'Nordland' => 7,
                                 'Oppland' => 5,
                                 'Oslo' => 20,
                                 'Rogaland' => 14,
                                 'Sogn og Fjordane' => 3,
                                 'Sør-Trøndelag' => 9,
                                 'Telemark' => 5,
                                 'Troms' => 7,
                                 'Vest-Agder' => 5,
                                 'Vestfold' => 7,
                                 'Østfold' => 8 }

    # Source: Valg i Norge, Valgkretser, Wikipedia, retrieved on 16 April 2015.
    # URL: http://no.wikipedia.org/wiki/Valg_i_Norge#Valgkretser
    NO_OF_LEVELING_SEATS = 19

    LEVELING_THRESHOLD = 0.04

    # TODO: Should use SAINTE-LAGUË
    # TODO: Should add leveling seats
    ELECTORAL_SYSTEM = LeveledProportional.new(LAST_ELECTION_RESULT,
                                               LAST_DETAILED_ELECTION_RESULT,
                                               DIRECT_SEAT_DISTRIBUTION,
                                               NO_OF_LEVELING_SEATS,
                                               LEVELING_THRESHOLD)

    def area_code
      'NO'
    end

    def population_size
      # Source: NSD European Election Database, Norway, retrieved on 14 April
      # 2015.
      # URL: http://www.nsd.uib.no/european_election_database/country/norway/
      2_836_029
    end

    def no_of_seats
      169
    end

    def threshold
      0.04
    end

    def seats(simulation)
      ELECTORAL_SYSTEM.project(simulation)
    end
  end
end