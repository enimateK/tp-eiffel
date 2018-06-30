class HELLO_WORLD
--
-- The "Hello World" example.
--
--

creation {ANY}
	main

feature {ANY}
	main is
		do
			io.put_string("Hello World.%N")
		end

end -- class HELLO_WORLD
