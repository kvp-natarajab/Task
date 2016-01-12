class Input
	@a=0
	@b=0
	def call_private
		display_values
	end

	private 
	def display_values
		puts "value of a:#{@a} and b:#{@b}"
	end

end

class Add<Input

	def initialize(x,y)
		@a=x
		@b=y
	end

	def add_two_value
		c=@a+@b
		puts "The value of a+b=#{c}"
	end
end
i=Input.new
i.call_private
add1=Add.new(3,6)
add1.call_private
add1.add_two_value

