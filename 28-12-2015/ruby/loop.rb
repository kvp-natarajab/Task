class Loop
	def loop_fun()
		i=0;
		while i<10 do 
			puts "value of i:#{i}\n"
			i+=1
		end
	end

	def for_fun()
		for i in 0...10
			puts "#{i}\n"
		end
	end

end

l1=Loop.new
l1.loop_fun
l1.for_fun