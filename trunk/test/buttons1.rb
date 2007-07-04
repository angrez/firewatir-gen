require 'rubygems'
require 'firewatir'
require 'firewatirgen'
include FireWatir
include FireWatirGen
@ff = Firefox.new
@ff.goto('file:///home/helder/work/firewatir/FireWatir/unittests/html/buttons1.html')
# raise "page title doesn't match" unless @ff.title == "Test page for buttons"
# raise "page title doesn't match" unless @ff.title == "Test page for buttons"
element_by_least_restrictive_xpath('descendant::*/FORM[@NAME=\"test1\"]/INPUT[@ID=\"b2\"]').click
# raise "page title doesn't match" unless @ff.title == "Pass Page"
element_by_least_restrictive_xpath('descendant::*/FORM[@NAME=\"test2\"]/INPUT[@TYPE=\"submit\"and @VALUE=\"Submit\"]').click
element_by_least_restrictive_xpath('descendant::*/FORM[@NAME=\"test3\"]/INPUT[@NAME=\"sub3\"and @VALUE=\"\"]').click
element_by_least_restrictive_xpath('descendant::*/FORM[@NAME=\"test1\"]/BUTTON[@ID=\"b7\"]').click
# raise "page title doesn't match" unless @ff.title == "Pass Page"
# raise "page title doesn't match" unless @ff.title == "Test page for buttons"
element_by_least_restrictive_xpath('descendant::*/FORM[@NAME=\"test1\"]/and @VALUE=\"\"]').click
# raise "page title doesn't match" unless @ff.title == "Pass Page"
element_by_least_restrictive_xpath('descendant::*/FORM[@NAME=\"test3\"]/INPUT[@NAME=\"sub3\"and @VALUE=\"\"]').click
element_by_least_restrictive_xpath('descendant::*/FORM[@NAME=\"test2\"]/INPUT[@TYPE=\"submit\"and @VALUE=\"Submit\"]').click
