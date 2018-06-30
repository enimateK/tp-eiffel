class FIBONACCI

insert
	ARGUMENTS
	
creation {ANY}
	make

feature {ANY}
	make is
		do
			if argument_count /= 1 or not argument(1).is_integer then
				io.put_string("Utilisation : ")
				io.put_string(argument(0))
				io.put_string(" <entier>%N")
				die_with_code(exit_failure_code)
			end
			io.put_integer(fibonacci(argument(1).to_integer))
			io.put_new_line
		end

	fibonacci (i: INTEGER): INTEGER is
		require
			i >= 0
		do
			Result := 0
		end

end

