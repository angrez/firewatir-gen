#!/usr/bin/env ruby
require 'tg4w_handler'

class Tg4wToFirewatir < Tg4wHandler

  def initialize(*args)
    super(*args)
    @output = <<-end
      require 'rubygems'
      require 'firewatir'
      require 'firewatirgen'
      include FireWatir
      include FireWatirGen
      @ff = Firefox.new
    end

  end

  def parse_fill(action)
    @output << <<-end
      element_by_least_restrictive_xpath('#{action['xpath']}').set('#{action['value']}')
    end
  end

  def parse_goto(action)
    @output << <<-end
      @ff.goto('#{action['value']}')
    end
  end

  def parse_verify_title(action)
    # FIXME don't know if raising an exception is the expected behavior
    # FIXME problem with internationalization. raise is commented until resolved.
    @output << <<-end
      # raise "page title doesn't match" unless @ff.title == "#{action['value']}"
    end
  end

  def parse_click(action)
    @output << <<-end
      element_by_least_restrictive_xpath('#{action['xpath']}').click
    end
  end

  def parse_check(action)
    # FIXME element_by_xpath() doesn't return it as Checkbox, therefore
    # it does not respond to set()
    if action['value'] == 'true'
      @output << <<-end
        element_by_least_restrictive_xpath('#{action['xpath']}').set
      end
    elsif action['value'] == 'false'
      @output << <<-end
        element_by_least_restrictive_xpath('#{action['xpath']}').clear
      end
    end
  end

  def parse_select(action)
    # FIXME element_by_xpath() doesn't return it as SelectList, therefore
    # it does not respond to select_value()
    @output << <<-end
      element_by_least_restrictive_xpath('#{action['xpath']}').select_value('#{action['value']}')
    end
  end

end

if $0 == __FILE__

  if ARGV.length != 1
    puts "Wrong number of arguments. Use: program <xml_file>"
    exit
  end

  xml_file = File.expand_path(ARGV[0])
  # dumb check
  if xml_file.split('.')[-1] != 'xml'
    puts "Not a .xml file"
    exit
  end

  rb_file = xml_file.split('.')[0..-2].join('.') << '.rb'
  if File.exists? rb_file
    puts "File #{rb_file} exists. \nOverwrite it? (y/N)"
    # need to make STDIN explicit because there's a filename in the
    # command-line argument (gets defaults to reading from it)
    if STDIN.gets.strip == 'y'
      File.delete(rb_file)
    else
      exit(true)
    end
  end

  doc = Document.new(File.read(xml_file))
  actions = Tg4wToFirewatir.parse_xml(doc)
  translator = Tg4wToFirewatir.new(actions)
  File.open(rb_file,'w') {|f| f << translator.translate}
end

