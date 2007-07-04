class MyListener
  def initialize file
    @file = file
    @output = <<-end
        require 'rubygems'
        require 'firewatir'
        require 'firewatirgen'
        include FireWatir
        include FireWatirGen
        @ff = Firefox.new

      end
  end
  # Called when a tag is encountered.
  # @p name the tag name
  # @p attrs a Hash of attribute/value pairs.
  # IE, <tag attr1="value1" attr2="value2">
  # will result in
  # tag_start( "tag", {"attr1" => "value1", "attr2" => "value2"})
  def tag_start name, attrs
    if name == 'action' 
      @action_type = attrs['type']
      # xpath and value are subelements of action
    elsif name == 'xpath' or name == 'value'
      @cdata_type = name
    end
  end
  # Called when the end tag is reached.  In the case of <tag/>, tag_end
  # will be called immidiately after tag_start
  # @p the name of the tag
  def tag_end name
    if name == 'actions' 
      # we're closing the list of actions
      # strip all lines
      @output = @output.split("\n").map {|l| l.strip}.join("\n") 
      puts @output
      @file << @output
    elsif name == 'action'
      case @action_type
      when 'goto'
        @output << <<-end
            @ff.goto('#{@value}')
          end
      when 'verify-title'
        # FIXME don't know if raising an exception is the expected behavior
        @output << <<-end 
            raise "page title doesn't match" unless @ff.title == "#{@value}"
          end
      when 'click'
        @output << <<-end
            element_by_least_restrictive_xpath('#{@xpath}').click
          end
      when 'check'
        # FIXME element_by_xpath() doesn't return it as Checkbox, therefore
        # it does not respond to set() right away
        if @value == 'true' 
          @output << <<-end 
              element_by_least_restrictive_xpath('#{@xpath}').set
            end
        elsif @value == 'false'
          @output << <<-end 
              element_by_least_restrictive_xpath('#{@xpath}').clear
            end
        end

      when 'select'
        # FIXME element_by_xpath() doesn't return it as SelectList, therefore
        # it does not respond to select_value() right away
        @output << <<-end
            element_by_least_restrictive_xpath('#{@xpath}').select_value('#{@value}')
          end
      end
    @action_type = nil
    elsif name == 'xpath' or name == 'value'
      @cdata_type = nil
    end
  end
end

# Called when <![CDATA[ ... ]]> is encountered in a document.
# @p content "..."
def cdata content
  case @cdata_type 
  when 'xpath'
    # tg4w's xpaths start with '*/', assuming the root is
    # /HTML/BODY/. so we need to replace one for the other,
    # as FireWatir uses the root at /HTML.
    content = content.sub('*/','/HTML/BODY/')
    # we also need double quotes to be escaped
    @xpath = content.gsub(/"/,'\\"')
  when 'value'
    @value = content
  end
end 

# we really don't care about the other tags and events that
# the stream parser may go through
def method_missing(:name, *args)
end
end
