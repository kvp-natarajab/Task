class Swap
	i=10
	j=20
	puts "i=#{i} and j=#{j}"
	i,j=j,i
	puts "i=#{i} and j=#{j}"
end

Swap.new

