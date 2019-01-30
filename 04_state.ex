# elixir

defmodule Queue do
  defstruct data: []

  def enqueue(queue, i) do
    {:ok, %Queue{data: [i | queue]}}
  end

  def dequeue(%Queue{data: []}) do 
    {:error, :empty_queue}
  end

  def dequeue(%Queue{data: [head, tail]}) do
    {:ok, head, %Queue{data: tail}}
  end
end


queue = %Queue{}
        |> Queue.enqueue(1)
        |> Queue.enqueue(2)
        |> Queue.enqueue(3)
        |> Queue.enqueue(4)
        |> IO.inspect

{:ok, _, queue} = Queue.dequeue(queue) # => {:ok, %Queue{data: [2,3,4]}}
{:ok, _, queue} = Queue.dequeue(queue) # => {:ok, %Queue{data: [3,4]}}
{:ok, _, queue} = Queue.dequeue(queue) # => {:ok, %Queue{data: [4]}}
{:ok, _, queue} = Queue.dequeue(queue) # => {:ok, %Queue{data: []}}


defmodule GlobalStack do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  # Client functions

  def push(i) do
    GenServer.cast(__MODULE__, {:push, i})
  end

  def pop() do
    GenServer.call(__MODULE__, :pop)
  end

  # Backend functions

  def init() do
    {:ok, []}
  end

  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end
end
