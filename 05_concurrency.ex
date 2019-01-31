# elixir

defmodule Fibonacci do
  def calc(1), do: 1
  def calc(2), do: 1
  def calc(3), do: 2
  def calc(n) do
    calc(n-1) + calc(n-2)
  end
end


defmodule ConcurrencyExample do
  def concurrently_do_work(list) do
    Enum.map(list, fn item -> 
      spawn_link(fn -> do_some_work(item) end)
    end)
  end

  defp do_some_work(item) do
    Fibonacci.calc(item)
    IO.puts(item)
  end
end

ConcurrencyExample.concurrently_do_work([40,40,40,40])
ConcurrencyExample.concurrently_do_work([40]) # => Takes the same amount of time as 4 iterations
