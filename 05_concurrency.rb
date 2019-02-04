# ruby

def fibonacci(n)
  if [0,1,2].include?(n)
    return 1
  end

  if n == 3
    return 2
  end

  return fibonacci(n-1) + fibonacci(n-2)
end

class ConcurrencyExample
  def concurrently_do_work(collection)
    threads = collection.map do |item|
      Thread.new do
        do_some_work(item)
      end
    end

    threads.map(&:join)
  end

  def do_some_work(item)
    x = fibonacci(item)
    puts "Fibonacci of #{item}: #{x}"
  end
end

x = ConcurrencyExample.new
start_time = Time.now
x.concurrently_do_work([35,35,35,35]) # => takes 4x as long as one iteration
end_time = Time.now

diff = end_time - start_time
puts "Took #{diff}" # => Took 5.125619

start_time = Time.now
x.concurrently_do_work([35])
end_time = Time.now
diff = end_time - start_time
puts "Took #{diff}" # => Took 1.252302
