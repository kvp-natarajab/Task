class Input
	@a=0
	@b=0
	def initialize(x,y)
		@a=x
		@b=y
	end

	private 
	def display_values
		puts "value of a:#{@a} and b:#{@b}"
	end

end


i=Input.new(2,6)
i.send(:display_values)

