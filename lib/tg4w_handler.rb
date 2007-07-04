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

  # - tg4w's xpaths start with '*/', assuming recursive search,
  # but that's not standard XPath. So we need to replace '*'
  # by 'descendant::*'.
  # - in firewatir, the generated xpath is embedded inside a pair
  # of double-quotes, so we have to escape them here.
  # - indexing is global in tg4w (FORM[3] means third form *in the
  # whole document*) and in standard XPath it's local (FORM[3] means
  # third form inside FORM[3]'s parent). our solution for now is to
  # get rid of indexes altogether. FIXME either fix upstream tg4w or
  # find a way to translate indexes properly.
  # - tg4w includes newline characters inside the xpath, so we have
  # to replace them by spaces (i don't know if that's enough) FIXME
  # returns the fixed xpath
  def self.fix_xpath(old_xpath)
    # proper recursion
    xpath = old_xpath.gsub('*','descendant::*')
    # get rid of numeric indexes
    xpath.gsub!(/\[\d+\]/,'')
    # escape double-quotes
    xpath.gsub!(/"/,'\\"')
    # no newlines
    xpath.gsub!("\n",' ') 
    xpath.squeeze(' ')
  end

  # Escapes single quotes.
  # This is to conform with the convention of generating code that
  # uses single quotes around strings.
  def self.escape(value)
    value.split("'").join(%q/\'/)
  end
  
  # extract all the info we need from the XML
  # into a Hash, without further references to
  # REXML types.
  # Parameter doc is of class REXML::Document
  def self.parse_xml(doc)
    action_elems = XPath.match(doc,'//action')
    actions = []
    action_elems.each do |a|
      hash = {}
      a.attributes.each {|name,value| hash[name] = value} 
      # expecting xpath and value cdatas
      a.elements.each {|e| hash[e.name] = e.text.strip}
      hash['xpath'] = fix_xpath(hash['xpath'])
      hash['value'] = escape(hash['value'])
      actions << hash
    end
    actions
  end

end 
