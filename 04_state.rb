# ruby

class Queue
  @data = []

  def enqueue(item)
    @data << item
    item
  end

  def dequeue
    @data.shift
  end
end

queue = Queue.new
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)

queue.dequeue # => 1
queue.dequeue # => 2
queue.dequeue # => 3
queue.dequeue # => 4


module GlobalStack
  module_function

  @data = []

  def push(i)
    @data << i
    i
  end

  def peek
    @data[0]
  end

  def pop
    @data.pop
  end
end
