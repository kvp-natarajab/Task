$num=10
class A
	#num=10 error
 	def print()
 		puts "class A num:#{$num}"
 	end
 end


class B<A
	def print()
		#super()
 		puts "class B num:#{$num}"
 	end
end

a=A.new
b=B.new

b.print
