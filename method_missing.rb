#method missing
class Car

 def method_missing(method, *args)
  puts "You called Car##{method} and passed the arguments #{args.join(', ')}"
  puts "You also passed a block" if block_given?
 end
end

merc = Car.new
merc.upgrade("Rolls Royce Wraith", '2015') {puts "That's a nice car!"}