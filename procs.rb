# All about procs
print "A proc is an instance of the object ", Proc.new {}.class, " and has an object id e.g. :" , Proc.new {}.object_id, "\n"
proc = Proc.new { puts "A proj object is instantiated by passing a block to Proc#new"}
proc.call
proc = Proc.new { puts "A proc can be assigned to a variable and is called using proc#call"}
proc.call
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

 proc
 
 
 
 
  

