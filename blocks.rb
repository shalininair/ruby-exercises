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

def closure
 x = 100
 yield
 yield
 yield 
end
puts "A block carries the scope it was defined in with it, implementing closures in Ruby"
x = 5
puts "Value of x before block is #{x}"
closure { x += 1}
puts "Value of x after block is #{x}"

closure do
 y = 0
 puts defined?(y) ? "Yes, y is defined in the block and is #{y}. y is now changed to #{y += 1}" : "No, y is not defined in the block."
 puts defined?(x) ? "Yes, x, defined in main, is accessed in the block and is #{x}. x is now changed to #{x += 1}" : "No, x, defined in main, is not accessed in the block."
end 
puts defined?(y) ? "Yes, y is defined in main." : "No, y is not defined in main."

# parameter handling non-rigid (argument semantics)
def ret_block
 x = 1
 y = 2
 z = 3
 yield(x,y,z)
 yield(x)
 yield(x,x,x,x)
 yield([x,y,z])
end
puts "blocks use non-rigid parameter handling aka argument semantics for handling parameters."
ret_block {|num1,num2,num3| puts "num1 is #{num1}, num2 is #{num2}, num3 is #{num3}"}
