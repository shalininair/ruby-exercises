# All about lambdas
#Instantiating lambdas
 puts lambda { " I am a lambda created using lambda {}, my class is #{lambda{}.class} and I've the object id #{lambda{}.object_id}"}.call 
 puts lambda { " I am a stabby lambda created using ->{}, my class is #{lambda{}.class} and I've the object id #{lambda{}.object_id}"}.call 
 l1 = lambda {" A lambda is just a different 'flavour' of proc and differs from proc in the object returned ( in this case, #{lambda{}}) and in the handling of it's return  and parameters "}
 puts l1.call
 l1 = lambda {puts " A lambda can be assigned to a variable and called using proc#call"}  
 l1.call
 # implements higher-order functions
  def pass_lambda (l1, number, l2)
     l1.call
     l2.call
     lambda {puts " A lambda can be output from a method, implementing the second property of higher-order functions"} 
  end

 l1 = lambda {puts " Lambdas can be passed as parameters, implementing the first property of higher-order functions."}
 l2 = lambda {puts " Unlike blocks, more than 1 lambda can be passed as parameters and need not be the last parameter passed."}
 pass_lambda(l1,2,l2).call

 # implements closures
 def closure
    n = 0
    l1 = lambda { "n was #{n}, and now is #{n += 1}"}
 end
 puts "A lambda carries the scope it was defined in with it, implementing closures in Ruby"
 puts "calling the method, outputting the lambda, as a standalone results in: ", closure.call
 a = closure
 puts "assigning the method, outputting the lambda, to a variable 'a'"
 puts "calling the method, outputting the lambda, from 'a' results in: ", a.call
 puts "calling the method, outputting the lambda, from 'a' results in: ", a.call
 puts "calling the method, outputting the lambda, from 'a' results in: ", a.call
 puts "calling the method, outputting the lambda, from 'a' results in: ", a.call
 puts "calling the method, outputting the lambda, as a standalone results in: ", closure.call
 b = closure
 puts "assigning the method, outputting the lambda, to a variable 'b'"
 puts "calling the method, outputting the lambda, from 'b' results in: ", b.call
 puts "calling the method, outputting the lambda, from 'a' results in: ", a.call
 puts "calling the method, outputting the lambda, from 'b' results in: ", b.call
 puts "calling the method, outputting the lambda, as a standalone results in: ", closure.call
 # handles returns differently from proc and implements anonymous functions in Ruby 
def ret_lambda
 l1 = lambda{ return "return from inside the lambda returns to the enclosing method, implementing anonymous functions in Ruby."}
 puts l1.call
 return true
end
ret_lambda
 # uses rigid parameter handling aka method semantics while handling parameters 
 l1 = lambda { |arg1, arg2, arg3| "arg1 is #{arg1}, arg2 is #{arg2}, arg3 is #{arg3}"}
 puts "lambda uses rigid parameter handling aka method semantics while handling parameters."
 puts "Passing 3 parameters to a lambda expecting 3 parameters results in ", l1.call(1,2,3)
 puts "Passing 4 parameters to a lambda expecting 3 parameters results in an error :" 
 #l1.call(1,2,3,4)
 puts "Passing 2 parameters to a lambda expecting 3 parameters results in an error :" 
 #l1.call(1,2)
 puts "A lambda does not unpack an array passed to it for parameter handling."
 #l1.call([1,2,3])
 puts "This lambda has #{l1.arity} mandatory parameters and in total #{l1.parameters.count} parameters and is defined in #{l1.source_location}"
 l1 = lambda { |arg1, arg2 , arg3 = :three, arg4 = :four, arg5| "arg1 is #{arg1}, arg2 is #{arg2}, arg3 is #{arg3}, arg4 is #{arg4}, arg5 is #{arg5}" }
 puts "This lambda has #{l1.arity} mandatory parameters and in total #{l1.parameters.count} parameters and is defined in #{l1.source_location}"
 puts "The arity #{l1.arity} is wrong as there are 3 mandatory parameters viz. #{l1.parameters}"
 puts l1.call(1,2,3)

