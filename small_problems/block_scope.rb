def call_me(some_code)
  some_code.call
end

name = ''
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Robert"
name = "Griffin III"        # re-assign name after Proc initialization


call_me(chunk_of_code)
