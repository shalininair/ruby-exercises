# All about procs
# Instantiating procs
print "A proc is an instance of the object ", Proc.new {}.class, " and has an object id e.g. :" , Proc.new {}.object_id, "\n"
proc = Proc.new { puts "A proc object is instantiated by passing a block to Proc#new"}
proc.call
proc = Proc.new { puts "A proc can be assigned to a variable and is called using proc#call"}
proc.call

# implementing higher-order functions using procs
def pass_proc1 (proc1, proc2, number, proc3)
   proc1.call
   proc2.call
   proc3.call 
   Proc.new { puts "#{number} procs have been passed as arguments to the currently executing method #{__method__.to_s}" }.call
   proc5 = Proc.new {puts "A proc can be output from a method. This is the second property of higher-order functions"} 
end

 proc1 = Proc.new { puts "procs can be passed as arguments/ parameters to a method. This is a property of higher-order functions."}
 proc2 = Proc.new { puts "Multiple procs can be passed to a method as arguments, whereas only 1 block can be passed to a method as an argument."}
 number = 3
 proc3 = Proc.new {puts "A proc need not be the last argument to a method, unlike a block"}
 pass_proc1(proc1, proc2, number, proc3).call
# implementing closures using proc
 def closure
   n = 0
   return Proc.new { "n was #{n}, n is now #{n += 1}"}
 end

  a = closure
  puts "assigning the method, outputting the proc, to a variable 'a'"
  puts "calling the method, outputting the proc, from 'a' results in: ", a.call
  puts "calling the method, outputting the proc, as a standalone results in: ", closure.call
  puts "calling the method, outputting the proc, from 'a' results in: ", a.call
  puts "calling the method, outputting the proc, from 'a' results in: ", a.call
  b = closure
  puts "assigning the method, outputting the proc, to a variable 'b'"
  puts "calling the method, outputting the proc, from 'b' results in: ", b.call
  puts "calling the method, outputting the proc, from 'b' results in: ", b.call
  puts "calling the method, outputting the proc, from 'b' results in: ", b.call
  puts "calling the method, outputting the proc, as a standalone results in: ", closure.call
  puts "a proc carries the scope it is defined in with it, implementing closures in Ruby"
# passing arguments to a proc
  arg_proc = Proc.new {|arg1, arg2, arg3| "arg1 is #{arg1}, arg2 is #{arg2}, arg3 is #{arg3}"} 
  puts "passing 3 arguments to a proc call expecting 3 arguments results in:", arg_proc.call( 1,2,3) 
  puts "A lambda would error out in the following scenarios"
  puts "passing 2 arguments to a proc call expecting 3 arguments results in:", arg_proc.call( 1,2)
  puts "passing 4 arguments to a proc call expecting 3 arguments results in:", arg_proc.call( 1,2,3,4)
  puts "passing 1 array as an argument to a proc expecting 3 arguments results in:", arg_proc.call([1,2,:a,:b])
  puts "passing 2 arrays as arguments to a proc expecting 3 arguments results in:", arg_proc.call([1,2,:a,:b], [:c, :d])
# proc handles return differently
  def ret_proc 
   proc = Proc.new { return "a return from inside the proc returns not only from the proc, but the method itself, unlike a lambda."}
   proc.call
   return "returning from inside the method"
  end
  puts ret_proc
 
 
  

