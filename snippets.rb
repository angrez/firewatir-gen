test = Document.new(File.new('empty_label.xml').entries.join("\n"))

#esses dois são equivalentes
actions = test.elements.to_a.first.elements.to_a.first.elements.to_a
test.elements["tg4w"].elements["actions"].elements.to_a

c = actions[0]

c.attributes
=> {"step"=>step='0', "type"=>type='goto', "refresh"=>refresh='.', "window"=>window='.'}

actions.select {|a| a.attributes["type"] == "goto"}
=> [<action step='0' type='goto' refresh='.' window='.'> ... </>]

c.elements.to_a
=> [<xpath> ... </>, <value> ... </>]


