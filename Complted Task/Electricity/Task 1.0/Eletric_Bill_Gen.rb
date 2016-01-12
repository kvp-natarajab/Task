$LOAD_PATH << '.'
require "Charges_module"

class User
	include Charges
		@consumer_no=""
		@emplyee_id=""
		@password=""
		@isLog=false
		# def initialiaze(cn_no,pas_d)
		# 	@consumer_no=cn_no
		# 	@password=pas_d
		# end

		def printConsumerNo
			@consumer_no
		end


		def  user_login
			puts "********************************************\n"
			puts "Enter your Employee Id: \n"
			@emplyee_id=gets.chomp
			puts "Enter your password\n"
			@password=gets.chomp
		end

		def user_logout
			puts "********************************************\n"
			if(@isLog)
				puts "Employee:"+@emplyee_id+" has successfully log outed.."
				@isLog=false
				@isBill=false	
			else
				puts "Please Log in"
			end
		end

		
end

class Pay<User
	@consumer_name=""
	@consumer_address=""
	@previous_reading=0
	@present_reading=0
	@unit_consumed=0
	@isBill=false
	
	
	def main
			while(true)
				puts "==========================Welcome to BESCOM==============================\n"
				puts "Select your option\n
						1:Log In\n
						2:Log Out\n
						3:Exit\n"
				ch=gets.to_i

				case ch
					when 1
						enter_login_details()
					when 2
						user_logout
					when 3
						if(@isLog)
							puts "---------------Please Log out--------------------"
						else
							break
						end
					else
						puts "Not a valid input\n"
				end
			end
	end	

	def enter_login_details()
				user_login
				# @consumer_no=@consumer_no.chomp
				#@password=@password.chomp
				if(!@isLog and @emplyee_id=="123" and @password=="ABC")
					puts "Employee:"+@emplyee_id+" has successfully loged in.."
					@isLog=true
					success_page()
				else
					puts "Login failed Please Check your details\n"
				end
	end

	def success_page()
		while(true)
				puts "==========================Pay Bill==============================\n"
				puts "Select your option\n
						1:Enter Bill details\n
						2:Generate Bill\n
						3:Exit\n"
				ch=gets.to_i

				case ch
					when 1
						enter_bill_details()
					when 2
						if(@isBill)
							generate_bill()
						else
							puts "Sorry!.....Please Pay Bill First\n"
						end
					when 3
						break
					else
						puts "Not a valid input\n"
				end
		end	

	end

	def enter_bill_details()
		puts "Enter consumer number\n"
		@consumer_no=gets
		puts "Enter consumer name\n"
		@consumer_name=gets
		puts "Enter consumer address\n"
		@consumer_address=gets
		puts "Enter Previous reading\n"
		@previous_reading=gets.to_i
		puts "Enter present reading\n"
		@present_reading=gets.to_i

		if @present_reading>=@previous_reading
			@unit_consumed=@present_reading-@previous_reading
			calculate_total(@unit_consumed)
			generate_bill()
		else
			puts "Present reading should be greater than or equal to previous reading\n"
		end

		
	end

	def calculate_total(unit)
		@tax=0.0
		@sub_total=0.0
		@basic_sub_total=0.0
		@normal_sub_total=0.0
		@more_sub_total=0.0
		@remaining_unit=0
		@basic_unit_usage=0
		@normal_unit_usage=0
		@more_unit_usage=0
		@total=0.0
		if(unit>0)
			if(unit>25)
				@basic_unit_usage=25
				@remaining_unit=unit-25
			else
				@basic_unit_usage=unit
			end
			@basic_sub_total+=@basic_unit_usage*Charges::BASIC_USAGE_CHARGE
			# puts "#{@basic_unit_usage}*#{Charges::BASIC_USAGE_CHARGE}=#{@basic_sub_total}"

		end
		if(@remaining_unit>0)
			if(@remaining_unit>20)
				@normal_unit_usage=20
				@remaining_unit=@remaining_unit-20
			else
				@normal_unit_usage=@remaining_unit
				@remaining_unit=0
			end
			@normal_sub_total+=@normal_unit_usage*Charges::NORMAL_USAGE_CHARGE
			# puts "#{@normal_unit_usage}*#{Charges::NORMAL_USAGE_CHARGE}=#{@normal_sub_total}"
		end

		if(@remaining_unit>0)
			@more_unit_usage=@remaining_unit
			@more_sub_total+=@more_unit_usage*Charges::MORE_USAGE_CHARGE
			# puts "#{@more_unit_usage}*#{Charges::MORE_USAGE_CHARGE}=#{@more_sub_total}"
		end
		@isBill=true
		@sub_total=@basic_sub_total+@normal_sub_total+@more_sub_total
		@sub_total+=Charges::FIXED_CHARGES
		@tax=@sub_total*Charges::TAX
		@total=@sub_total+@tax
	end

	def generate_bill()
		puts "==================================Reciept============================================"
		puts "Date of payment:#{Time.new.inspect}"
		puts "Consumer Number:#{@consumer_no}"
		puts "Consumer Name:#{@consumer_name}"
		puts "Consumer address:#{@consumer_address}"
		puts "Previous reading:#{@previous_reading}"
		puts "Present reading:#{@present_reading}"
		print_unit_charge_chart
		puts "#{@basic_unit_usage}\t#{Charges::BASIC_USAGE_CHARGE}\t#{@basic_sub_total}"
		puts "#{@normal_unit_usage}\t#{Charges::NORMAL_USAGE_CHARGE}\t#{@normal_sub_total}"
		puts "#{@more_unit_usage}\t#{Charges::MORE_USAGE_CHARGE}\t#{@more_sub_total}"
		puts "Fixed Monthly Meter charge:#{Charges::FIXED_CHARGES}\n"
		puts "VAT\t#{Charges::TAX}:\t#{@tax}\n"
		puts "Total:#{@total}"
	end

	def print_unit_charge_chart
		puts "----------------------------------Charge List--------------------------------------"
		puts "Level			usage unit 		charge per unit"
		puts "basic 			25 				1.0"
		puts "normal 			20 				2.70"
		puts "more 							4.0"
		puts "-----------------------------------------------------------------------------------"
	end
end
p=Pay.new
p.main



