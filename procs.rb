# All about procs
# Instantiating procs
print "A proc is an instance of the class ", Proc.new {}.class, " and has an object id. In this case it's " , Proc.new {}.object_id, "\n"
proc = Proc.new { puts "A proc object is instantiated by passing a block to Proc#new"}
proc.call
proc = Proc.new { puts "A proc can be assigned to a variable and is called using proc#call"}
proc.call

# implements higher-order functions in ruby
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
# implements closures in Ruby
 def closure
   n = 0
   return Proc.new { "n was #{n}, n is now #{n += 1}"}
 end
  
  puts "A proc carries the scope it was defined in with it, implementing closures in Ruby"
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
  
# uses non-rigid parameter handling aka argument semantics while handling parameters/ arguments 
  arg_proc = Proc.new {|arg1, arg2, arg3| "arg1 is #{arg1}, arg2 is #{arg2}, arg3 is #{arg3}"} 
  puts "passing 3 arguments to a proc call expecting 3 arguments results in:", arg_proc.call( 1,2,3) 
  puts "A lambda would error out in the following scenarios"
  puts "passing 2 arguments to a proc call expecting 3 arguments results in:", arg_proc.call( 1,2)
  puts "passing 4 arguments to a proc call expecting 3 arguments results in:", arg_proc.call( 1,2,3,4)
  puts "passing 1 array as an argument to a proc expecting 3 arguments results in:", arg_proc.call([1,2,:a,:b])
  puts "passing 2 arrays as arguments to a proc expecting 3 arguments results in:", arg_proc.call([1,2,:a,:b], [:c, :d])
# proc handles return differently
  def ret_proc 
   proc = Proc.new { return "a return from inside the proc returns not only from the proc, but the enclosing method itself, unlike a lambda."}
   proc.call
   return "returning from inside the method"
  end
  puts ret_proc

  def ret_proc
    Proc.new
  end
  proc = ret_proc { "a proc without an attached block can be called from a method call with a block" }
  puts proc.call
  puts "This proc has #{proc.arity} mandatory parameters, proc has #{0 if proc.parameters.empty?} no. of parameters and is defined in #{proc.source_location}"

  class Tea

    def initialize
        puts "There are so many tea's to taste. Which of them would you like to try?"      
    end

    def drink &tea_name
      tea_name.call(self) 
    end

    def oolong
        "oolong is very tasty."
    end

    def green_tea
        "green tea is very healthy."
    end

    def earl_grey
        "earl grey is very refreshing."
    end
  end 
  
  puts "Implementing Proc#symbol"
  tea = Tea.new
  puts tea.drink(&:oolong)
  puts tea.drink(&:green_tea)
  puts tea.drink(&:earl_grey)


  def ret_proc(arg1)
    
    case arg1.call
     when 2
       puts "The proc evaluates to a number and has value #{arg1.call}"
     when 'ac'
       puts "The proc evaluates to a string and has value #{arg1.call}"
     end 

  end
   
   puts "Using a proc in a case statement" 
   proc = Proc.new { 1 + 1 }
   ret_proc(proc)
   proc = Proc.new { 'a' + 'c' }
   ret_proc(proc)
 
  

