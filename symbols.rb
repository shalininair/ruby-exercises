    symbols_as_strings = Symbol.all_symbols.map { |x| x.to_s }
    puts '1', symbols_as_strings.include?("test_method_names_become_symbols")    
    puts '2', Symbol.all_symbols.include?(:test_method_names_become_symbols)
    # puts symbols_as_strings.include?("test_method_names_become_cymbals")
    # puts Symbol.all_symbols.include?(:test_method_names_become_cymbals)
    # puts symbols_as_strings.include?("test_method_names_become_cymbals")

# def test_method;end
# symbols = Symbol.all_symbols # This is already a "fixed" array, no need for map
# puts symbols.include?(:test_method)
# puts symbols.include?('test_method_nonexistent'.to_sym)
# puts symbols.include?(:test_method_nonexistent)
# eval 'puts symbols.include?(:really_not_there)'