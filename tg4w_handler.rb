require 'rexml/document'
include REXML

class Tg4wHandler

  def initialize(actions)
    @actions = actions
  end

  # dispatches each action to the method that should take care
  # of it and returns the output. at the moment there are the 
  # following actions:
  #
  # alert
  # assert-text-does-not-exist
  # assert-text-exists
  # check
  # click
  # confirm
  # fill
  # goto
  # select
  # verify-title
  #
  # Subclasses should implement one method for each, in the
  # form parse_<action_name>. Ex.: parse_verify_title
  # Note that we can't have methods with dashes.
  def translate
    @actions.each do |a|
      self.send(:"parse_#{a['type'].gsub('-','_')}", a)
    end
    @output = @output.split("\n").collect {|l| l.strip}.join("\n")
  end

  # tg4w's xpaths start with '*/', assuming the root is
  # /HTML/BODY/. so we need to replace one for the other,
  # as FireWatir uses the root at /HTML.
  # returns the fixed xpath
  def self.fix_xpath(old_xpath)
    xpath = old_xpath.sub('*/','/HTML/BODY/')
    # we also need double quotes to be escaped
    xpath.gsub(/"/,'\\"')
  end


  # extract all the info we need from the XML
  # into a Hash, without further references to
  # REXML types
  def self.parse_xml(doc)
    action_elems = XPath.match(doc,'//action')
    actions = []
    action_elems.each do |a|
      hash = {}
      a.attributes.each {|name,value| hash[name] = value} 
      # expecting xpath and value cdatas
      a.elements.each {|e| hash[e.name] = e.text.strip}
      hash['xpath'] = fix_xpath(hash['xpath'])
      actions << hash
    end
    actions
  end

end 
