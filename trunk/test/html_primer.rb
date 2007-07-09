require 'rubygems'
require 'firewatir'
require 'firewatirgen'
include FireWatir
include FireWatirGen
@ff = Firefox.new
@ff.goto('http://www.htmlprimer.com/guides/HTML/Tutorials/articles/htmlForms.html')
# raise "page title doesn't match" unless @ff.title == "HTML Forms"
# raise "page title doesn't match" unless @ff.title == "HTML Forms"
element_by_least_restrictive_xpath('descendant::*/FORM/INPUT[@TYPE=\"text\" and @NAME=\"var name\"]').set('qwerqwerqwerwqr')
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/INPUT[@TYPE=\"text\" and @NAME=\"var name\"]').set('qwerqwerqwerw')
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/INPUT[@NAME=\"var name\" and @VALUE=\"default value\"]').click
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/INPUT[@NAME=\"var name\" and @VALUE=\"default value\"]').click
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/INPUT[@NAME=\"var name\" and @VALUE=\"default value\"]').click
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/INPUT[@NAME=\"var name\" and @VALUE=\"default value\"]').click
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/SELECT[@NAME=\"variable name\"]').select_value('Hungry')
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/TEXTAREA[@NAME=\"variable name\"]').set('weqrqwefasdfwqerqw')
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/INPUT[@TYPE=\"submit\"]').click
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/INPUT[@TYPE=\"reset\"]').click
element_by_least_restrictive_xpath('descendant::*/FORM/INPUT[@TYPE=\"text\" and @NAME=\"email\"]').set('erqewsdfsadf')
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/TEXTAREA[@NAME=\"comments\"]').set('qerqwefasdfwqerqwe')
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/INPUT[@NAME=\"var name\" and @VALUE=\"default value\"]').click
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/INPUT[@NAME=\"var name\" and @VALUE=\"default value\"]').click
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/INPUT[@NAME=\"var name\" and @VALUE=\"default value\"]').click
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/INPUT[@TYPE=\"checkbox\" and @NAME=\"var name\"]').set
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/INPUT[@TYPE=\"checkbox\" and @NAME=\"var name\"]').set
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/INPUT[@TYPE=\"checkbox\" and @NAME=\"var name\"]').set
element_by_least_restrictive_xpath('descendant::*/FORM/INPUT[@TYPE=\"checkbox\" and @NAME=\"var name\"]').set
element_by_least_restrictive_xpath('descendant::*/FORM/descendant::*/INPUT[@TYPE=\"checkbox\" and @NAME=\"var name\"]').clear
element_by_least_restrictive_xpath('TABLE[@ID=\"articles\"]/TBODY/TR/TD/TABLE/TBODY/TR/TD/descendant::*/SELECT[@NAME=\"_\"]').select_value('Hominy Grits')
element_by_least_restrictive_xpath('TABLE[@ID=\"articles\"]/TBODY/TR/TD/TABLE/TBODY/TR/TD/descendant::*/INPUT[@TYPE=\"submit\" and @VALUE=\"SUBMIT\"]').click
element_by_least_restrictive_xpath('TABLE[@ID=\"articles\"]/TBODY/TR/TD/TABLE/TBODY/TR/TD/descendant::*/INPUT[@TYPE=\"reset\" and @VALUE=\"Reset\"]').click

