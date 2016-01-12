class Car
	@color=""
	@engineNumber=0
	@name=""
	
	def display()
		puts "Name:#{@name}"
		puts "Engine No:#{@engineNumber}"
		puts "color:#{@color}"
	end

end

class Maruthi<Car
	@no_of_seat=0
	@isPower_brake=false
	def initialize(color,eng_no,name,no_seat,brake)
		@color=color
		@engineNumber=eng_no
		@name=name
		@no_of_seat=no_seat
		@isPower_brake=brake
	end

end

m=Maruthi.new("red",123567,"Ertiga",4,true)
m.display