# ruby

class SomethingThatHoldsData
  @my_data

  attr_reader :my_data
  attr_accessor :my_data
end

instance = SomethingThatHoldsData.new

instance.my_data = 3
instance.my_data # => 3
