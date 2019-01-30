#  ruby

class HelloWorld
  def say_something(something)
    puts(something)
  end
end

array = [1,2,3,4]

array.map do |i|
  i * i
end # => [1,4,9,16]

def some_global_function
  some_undefined_function(1) # => won't error until encountered at runtime
end
