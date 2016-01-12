$a_global=10
class Variable1
	@@count=0
	def initialize(id,name)
		@id=id
		@name=name
		@@count+=1
	end

	def display_value()
		age=30
		puts "id:#{@id}"
		puts "name:#{@name}"
		puts "count:#{@@count}"
		puts "local variable value age:#{age}"
		puts "Global value:#{$a_global}"
		puts "======"
	end

end

class Variable2
	@@count=0
	def initialize(id,name)
		@id=id
		@name=name
		@@count+=1
	end

	def display_value()
		puts "id:#{@id}"
		puts "name:#{@name}"
		puts "count:#{@@count}"
		puts "Global value:#{$a_global}"
		puts "======"
	end

end



V1=Variable1.new(1,"A")
V1.display_value
V2=Variable2.new(2,"B")
V2.display_value
V3=Variable2.new(3,"C")
V3.display_value