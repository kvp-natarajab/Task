class Switch
	def main()
		fun_operation()
	end

	def add()
		a=gets.to_i
		b=gets.to_i
		puts "a+b=#{a+b}"
	end

	def fun_operation()
		while(true)
			puts "Select your option\n
				1:add\n
				2:sub\n
				3:mul\n
				4:div\n
				5:Exit"
				ch=gets.to_i
		
				case ch
					when 1
						add()
					when 2
						sub()
					when 3
						mul()
					when 4
						div()
					when 5
						break
					else
						puts "Not a valid input\n" 
					end
				end
		end		
end

s=Switch.new
s.main