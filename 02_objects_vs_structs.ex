# elixir

defmodule SomethingThatHoldsData do
  defstruct my_data: nil
end

x = %SomethingThatHoldsData{}
x.my_data # => nil

y = %{x | my_data: 3}
y.my_data # => 3

x.my_data # => nil

