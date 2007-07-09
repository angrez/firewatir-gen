# TODO turn this into a unit test
require 'firewatirgen'
require 'rubygems'
require 'firewatir'
include FireWatir
include FireWatirGen
@ff = Firefox.new
@ff.goto('http://www.voegol.com.br')
element_by_least_restrictive_xpath('/HTML/BODY/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[1]/TD[1]/DIV[1]/TABLE[1]/TBODY[1]/TR[1]/TD[1]/A')
