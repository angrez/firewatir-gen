module FireWatirGen
  # xpath must be rooted (starts with /bla)
  def element_by_least_restrictive_xpath(xpath)
    puts '## full xpath:'
    puts xpath
    last_element = []
    xpath.split(/\//).reverse.each do |element|
      ele = @ff.elements_by_xpath('//' + last_element.push(element).reverse.join('/'))
      puts '-- current xpath: //' + last_element.reverse.join('/')
      puts "-- number of elements: #{ele.length}"
      if ele.length == 1
        puts '## least restrictive xpath that guarantees uniqueness:'
        puts '//'+last_element.reverse.join('/')
        return ele.first
      end
    end
  end
end

