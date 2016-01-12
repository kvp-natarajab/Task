
$arr=Array.new
class Sort

	def main()
		get_elements()
		sort_fun()
		display()	
	end

	def get_elements()
		puts "Enter a length of array"
		n=gets.to_i
		puts "Enter a #{n} elements"
		for i in 0..n-1
			$arr[i]=gets.to_i
		end
	end


	def sort_fun()
		l=$arr.length-1
		for i in 0..l
			num=$arr[i]
			j=i-1
			while j>=0 && $arr[j]>num
				$arr[j+1]=$arr[j]
				j=j-1
			end
			$arr[j+1]=num
		end
	end

	def display()
		l=$arr.length-1
		puts "==Sorted values=="
		for i in 0..l
			puts $arr[i]
		end
	end
end

sort1=Sort.new
sort1.main
