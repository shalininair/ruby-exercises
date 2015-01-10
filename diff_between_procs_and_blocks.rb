#Difference between procs and blocks
# A proc is an instance of Proc.new and is an object
Proc.new {p "I am a proc and an instance of Proc.new "}
# proc can be assigned to a variable
p = Proc.new { print "I am a proc and assigned to a variable"}
puts "#{p.call}, my class is #{p.class} and my object id is #{p.object_id}"
# A proc can return itself 
a = p
puts "#{a.call}, my class is #{a.class} and my object id is #{a.object_id}"
puts "{puts \" I am a block \" }, cannot be assigned to a variable and do not have an object id"
puts "I work as part of the syntax of a method call"
