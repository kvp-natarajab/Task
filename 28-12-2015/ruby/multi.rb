class Father

	def intialize(sname)
		@sname=sname
	end

	def getSurname
		@sname
	end

	def setSurname=(value)
		@sname=value
	end



end


class Son<Father
	def intialize(name,sname)
		super(sname)
		@name=name
	end
def getName
	@name
end 
def setName=(value)
	@name=value
end
	def display_name()
		puts "#{@name}"
	end

end
puts "enter name :"
p=STDIN.gets
puts "enter surname :"
q=STDIN.gets
s=Son.new(p,q)


x=s.getName()
y=s.getSurname()
puts "#{x}"
puts"#{y}"