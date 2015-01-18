#send
puts "send allows us to send messages on an object, in this case Fixnum#+"
puts 1.send(:+, 2)

class Car
 attr_accessor :make
 def initialize (model, year)
  @make ||= {}
  @make[model] = year
 end

 private
 def upgrade(model, year)
   @make[model] = year
   "#{model} upgraded to #{year}."
 end
end

puts "send can be used to access private methods."
merc = Car.new("Mercedes", 1967)
merc.make.each {|k,v| puts "the car model is #{k} and the year is #{v}. "}
#merc.upgrade("Mercedes", 1980)
puts "Calling an object's private method, in this case Car#upgrade, using send will not error out."
merc.send(:upgrade,"Mercedes",1990)
merc.make.each {|k,v| puts "the car model is upgraded to #{k}, year #{v}. "}