require 'rubygems'
require 'firewatir'
require 'firewatirgen'
include FireWatir
include FireWatirGen
$KCODE = 'u'
@ff = Firefox.new
@ff.goto('http://www.voegol.com.br/')
puts ".....:GOL:..:LINHAS AÉREAS INTELIGENTES:......"
puts @ff.title
raise "page title doesn't match" unless @ff.title == ".....:GOL:..:LINHAS AÉREAS INTELIGENTES:......"
element_by_least_restrictive_xpath('descendant::*/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[1]/TD[2]/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[3]/TD[2]/TABLE[1]/TBODY[1]/TR[1]/TD[2]/SELECT[@NAME=\"sector1_o\"]').select_value('aGRU')
element_by_least_restrictive_xpath('descendant::*/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[1]/TD[2]/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[4]/TD[2]/TABLE[1]/TBODY[1]/TR[1]/TD[2]/SELECT[@NAME=\"sector1_d\"]').select_value('CGR')
element_by_least_restrictive_xpath('descendant::*/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[1]/TD[2]/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[5]/TD[3]/SELECT[@NAME=\"sector_1_d\"]').select_value('10')
element_by_least_restrictive_xpath('descendant::*/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[1]/TD[2]/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[6]/TD[3]/SELECT[@NAME=\"sector_2_d\"]').select_value('14')
element_by_least_restrictive_xpath('descendant::*/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[1]/TD[2]/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[11]/TD[2]/INPUT[@NAME=\"b_search\" and @VALUE=\"procurar vôos\"]').click
# raise "page title doesn't match" unless @ff.title == "Reservas OnLine"
element_by_least_restrictive_xpath('descendant::*/TABLE[2]/TBODY[1]/TR[4]/TD[2]/TABLE[2]/TBODY[1]/TR[1]/TD[1]/TABLE[3]/TBODY[1]/TR[1]/TD[1]/TABLE[4]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[2]/TD[3]/A[1]').click
element_by_least_restrictive_xpath('descendant::*/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[1]/TD[2]/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[3]/TD[2]/TABLE[1]/TBODY[1]/TR[1]/TD[2]/SELECT[@NAME=\"sector1_o\"]').select_value('aCGH')
element_by_least_restrictive_xpath('descendant::*/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[1]/TD[2]/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[11]/TD[2]/INPUT[@NAME=\"b_search\" and @VALUE=\"procurar vôos\"]').click
# raise "page title doesn't match" unless @ff.title == "Reservas OnLine"
