# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # WRITE THIS CODE
  # soluton works
  # if a == b && a == c
  #  return :equilateral 
  # elsif ( b == c && a != b ) || (a == b && a != c) || (a == c && a != b)
  #  return :isosceles    
  # else
  #  return :scalene
  # end
  # refactored to an elegant solution
  # case [a,b,c].uniq.size
  # when 1 
  #     :equilateral 
  # when 2
  #     :isosceles 
  # else
  #     :scalene
  # end
  #refactored again
 
 raise TriangleError if [a,b,c].min <= 0
 array = [a,b,c].sort
 raise TriangleError if array[2] >= (array[1] + array[0]) 
 
 [:equilateral, :isosceles, :scalene].fetch([a,b,c].uniq.size - 1)    
  
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
