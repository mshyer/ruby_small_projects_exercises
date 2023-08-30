require "socket"

def parse_request(request_line)
  http_method, path_and_params, http = request_line.split(" ")
  path, params = path_and_params.split("?")
  params = params.split("&")
  params = params.each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end
  [http_method, path, params]
end
  

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept
  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  #"GET /?rolls=2&sides=6 HTTP/1.1"
  # http_method = request_line.slice(/\A\w*/)
  http_method, path, params = parse_request(request_line)
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  # client.puts "HTTP/1.0 200 OK"
  rolls = params["rolls"].to_i
  sides = params["sides"].to_i

  client.puts "<!DOCTYPE html>"
  client.puts "<html>"
  client.puts "<style>"
  client.puts   "h1 { "
  client.puts     "background: red ;"
  client.puts   "}"
  client.puts "</style>"
  client.puts "<body>"
  rolls.times do
    roll = rand(sides) + 1
    client.puts "<p>Your roll is #{roll}!</p>"
  end
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"
  client.puts "<h1>Let's roll some dice!</h1>"
  client.puts "</body>"
  client.puts "</html>"
  


  client.close
end


# client.puts request_line
# client.puts "Content-Type: text/plain\r\n\r\n"
# client.puts "HTTP/1.1 200 OK\r\n\r\n"
# puts http_method == "GET"
# puts path
# puts path == "/"
# puts params
# puts params == { "rolls" => "2", "sides" => "6" }