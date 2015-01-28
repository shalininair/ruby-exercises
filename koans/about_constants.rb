require File.expand_path(File.dirname(__FILE__) + '/neo')

C = "top level"

class AboutConstants < Neo::Koan

  C = "nested"

  def test_nested_constants_may_also_be_referenced_with_relative_paths
    assert_equal "nested", C
  end

  def test_top_level_constants_are_referenced_by_double_colons
    assert_equal "top level", ::C
  end

  def test_nested_constants_are_referenced_by_their_complete_path
    assert_equal "nested", AboutConstants::C
    assert_equal "nested", ::AboutConstants::C
  end

  # ------------------------------------------------------------------

  class Animal
    LEGS = 4
    def legs_in_animal
      LEGS
    end

    class NestedAnimal
      def legs_in_nested_animal
        LEGS
      end
    end
  end

  def test_nested_classes_inherit_constants_from_enclosing_classes
    assert_equal 4, Animal::NestedAnimal.new.legs_in_nested_animal
  end

  # ------------------------------------------------------------------

  class Reptile < Animal
    def legs_in_reptile
      LEGS
    end
  end

  def test_subclasses_inherit_constants_from_parent_classes
    assert_equal 4, Reptile.new.legs_in_reptile
  end

  # ------------------------------------------------------------------

  class MyAnimals
    #p Module.nesting      
    LEGS = 2

    class Bird < Animal
      def legs_in_bird
        #p Module.nesting 
        LEGS
      end
    end
  end

  def test_who_wins_with_both_nested_and_inherited_constants
    assert_equal 2, MyAnimals::Bird.new.legs_in_bird
  end

  # QUESTION: Which has precedence: The constant in the lexical scope,
  # or the constant from the inheritance hierarchy?
  #=>The constant in the lexical scope has precedence as the constant has been redefined 
  #=>The MyAnimals class redefines LEGS, so anything that uses LEGS, and is defined inside MyAnimals, 
  #=>will look for LEGS inside MyAnimals first. 
  #=>Bird is defined in MyAnimals and inherits Animal, so it's lexical scope is MyAnimals.

  # ------------------------------------------------------------------

  class MyAnimals::Oyster < Animal
    def legs_in_oyster
      #p Module.nesting      
      LEGS
    end
  end

  def test_who_wins_with_explicit_scoping_on_class_definition
    #p Module.nesting
    assert_equal 4, MyAnimals::Oyster.new.legs_in_oyster
  end

  # QUESTION: Now which has precedence: The constant in the lexical
  # scope, or the constant from the inheritance hierarchy?  Why is it
  # different than the previous answer?
  #=>constants are looked up in the lexical scope of the place where they are used first ([AboutConstants]) 
  #=>and in the inheritance hierarchy second(Animal). 
  #=>Oyster though nested in MyAnimals, is not defined in MyAnimals and so inherits Animal, so it's lexical scope is Animal. 
  #=>Bird is defined in MyAnimals and inherits Animal, so it's lexical scope is MyAnimals.
end
