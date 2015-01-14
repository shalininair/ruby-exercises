#All about blocks
puts "Blocks are not objects, they have no class and no object id. they also cannot be assigned to a variable" 
#puts b1 = {"I am a block"}
#puts b1.object_id
# cannot be assigned to a variable"
# implments higher-order functions
def pass_block (&block)
 block.call
end
 puts pass_block {"A block can be passed as a parameter to a method, implementing the first property of higher-order functions in ruby."}

#def pass_block(&b1, number, &b2)
# puts b1.call
#puts number
# puts b2.call
#end 
#pass_block({"param1"}, number , {"param2"}))

puts "Only one block can be passed to a method and it has to be the last parameter"


def ret_block(&block)
  block
end

puts ret_block {"Blocks cannot be returned from a method."}.call
puts ret_block {"A block passed explicitly to a method and accessed using '&' in the method definition gets converted to a proc."}.call
puts "In this case the returned object is  #{ret_block {}.class} and it's object id is #{ret_block{}.object_id} " 

def ret_block
   yield
end
ret_block { print "A block can be passed to a method even if the method definition does not have any arguments,"}
ret_block { puts "in which case the block can only be executed with a yield."}

# implement closures in ruby
# #array = [1,2,3,4]
# def closure
#  n = -1
#  puts "n was #{n} and is now #{n += 5}"
#  puts yield
#  puts yield
# puts yield
#end
#closure { n += 1 }
 

# parameter handling rigid (method semantics)/ non-rigid (argument semantics)

