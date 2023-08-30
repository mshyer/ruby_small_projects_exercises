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
  client.puts "HTTP/1.1 200 OK\r\n\r\n"
  client.puts "Content-Type: text/plain\r\n\r\n"
  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)


  client.puts http_method
  client.puts path
  client.puts params

  


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