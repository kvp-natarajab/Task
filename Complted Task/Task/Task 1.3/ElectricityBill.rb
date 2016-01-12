$LOAD_PATH << '.'
require "Charges_module"

module ElectricityBill
class Employee

    def initialize(user_name,pass_word)
        @emp_id=user_name
        @password=pass_word
    end

    def login
      (@emp_id=="123" and @password=="abc") ? true:false
    end

end

class  Bill< Employee
    
    include Charges
    def initialize(user,pswd)
        super(user,pswd)
        @consumer_info_arg=["consumer_no","consumer_name","address","division","previous_reading","present_reading"]
    end
    
    
    def enter_details
        puts "Please Provide consumer details"
        @consumer_info_arg.each do |e|
            puts "Enter #{e.capitalize.sub("_"," ")}"
            instance_variable_set("@#{e}",gets.chomp)
        end
        generate_bill
    end
    
    def validate_details
        if @present_reading.to_i >= @previous_reading.to_i 
            true
        else
            false
        end
    end
    
    def generate_bill
        if validate_details
            @tax=0.0
            @total=0.0
            @total_unit_usage=0
            @total_unit_usage=@present_reading.to_i-@previous_reading.to_i

            calculate_bill(@total_unit_usage)
            
            @total+=Charges::FIXED_CHARGES
            @tax=@total*Charges::TAX
            @total+=@tax
            display_details
        else
            puts "::::::Error::::::Present reading should be greater than or equal to previous reading\n" 
        end
    end
    

    def calculate_bill(unit)
                remaining_unit=0
                if unit>35
                    remaining_unit=unit-35
                    unit=35
                end
                @total+=unit*Charges::BASIC_USAGE_CHARGE
                if remaining_unit>40
                    unit=40
                    remaining_unit=remaining_unit-40
                else
                    unit=remaining_unit
                    remaining_unit=0
                end
                @total+=unit*Charges::NORMAL_USAGE_CHARGE
                if remaining_unit>0
                    @total+=remaining_unit*Charges::MORE_USAGE_CHARGE
                end
    end

    def print_unit_charge_chart
		puts "\n----------------------------------Charge List--------------------------------------"
		puts "Usage unit 		charge per unit"
		puts "0-35                    1.0"
		puts "36-75                   2.70"
		puts ">75                     4.0"
		puts "-----------------------------------------------------------------------------------\n"
	end
    
    def display_details
        puts "::::::::::::::::::::::::::::::::Consumer Information::::::::::::::::::::::::::::::::\n"
        @consumer_info_arg.each do |e| 
                 puts "#{e.capitalize.sub("_", " ")} : #{instance_variable_get("@#{e}")}"
        end
        print_unit_charge_chart
        puts "Total usage:\t #{@total_unit_usage}"
		puts "Fixed Monthly Meter charge:\t#{Charges::FIXED_CHARGES}\n"
		puts "VAT\t#{Charges::TAX}:\t#{@tax}\n"
		puts "TOTAL:\t#{@total}"
		puts "::::::::::::::::::::::::::::::::::::THANK YOU:::::::::::::::::::::::::::::::::::::::\n\n"
    end
    
end
end

puts "Enter Employee id:"
id=gets.chomp
puts "Enter Password:"
password=gets.chomp

b=ElectricityBill::Bill.new(id,password)

if b.login
    b.enter_details
else
    puts "Login failed!....."
end
