class Swap
	def swap_fun(a,b)
		puts "a:#{a} and b:#{b}"
		a=a+b
		b=a-b
		a=a-b
		puts "a:#{a} and b:#{b}"
	end
end

s=Swap.new
s.swap_fun(10,20)
