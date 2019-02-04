# elixir

defmodule Parallel do
  def pmap(collection, func) do
    collection
    |> Enum.map(&(Task.async(fn -> func.(&1) end)))
    |> Enum.map(&Task.await/1)
  end
end

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
    Parallel.pmap(list, fn item -> do_some_work(item) end)
  end

  defp do_some_work(item) do
    Fibonacci.calc(item)
    IO.puts(item)
  end
end

start_time = :os.system_time(:millisecond)
ConcurrencyExample.concurrently_do_work([40,40,40,40])
end_time = :os.system_time(:millisecond)
diff = end_time - start_time
IO.puts("Took #{diff}") # => Took 1662

start_time = :os.system_time(:millisecond)
ConcurrencyExample.concurrently_do_work([40]) # => Takes the same amount of time as 4 iterations
end_time = :os.system_time(:millisecond)
diff = end_time - start_time
IO.puts("Took #{diff}") # => Took 1582
