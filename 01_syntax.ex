# elixir

defmodule HelloWorld do
  def say_something(something) do
    IO.puts(something)
  end
end

list = [1,2,3,4]

Enum.map(list, fn i -> i * i end) # => [1,4,9,16]
