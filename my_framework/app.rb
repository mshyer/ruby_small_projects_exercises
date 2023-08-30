require_relative "advice"
require_relative "framework"
# def erb(filename, local = {})

piece_of_advice = Advice.new.generate 

# class HelloWorld
#   def call(env)
#     case env['REQUEST_PATH']
#     when '/'
#       ['200', {'Content-Type' => 'text/html'}, ["#{erb("index")}"]]
#     when '/advice'
      
#       ['200', {'Content-Type' => 'text/html'}, ["#{erb("advice")}"]]
#     else
#       ['404', {'Content-Type' => 'text/html', "Content-Length" => '60'}, ["#{erb("not_found")}"]]
#     end
#   end
# end
class App < Framework
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      # ['200', {"Content-Type" => "text/html"}, [erb(:index)]]
      status = '200'
      headers = {"Content-Type" => "text/html"}
      response(status, headers) do
        erb :index
      end
    when '/advice'
      piece_of_advice = Advice.new.generate
      # ['200', {"Content-Type" => "text/html"}, [erb(:advice, message: piece_of_advice)]]
      status = '200'
      headers = {"Content-Type" => "text/html"}
      response(status, headers) do
        erb :advice, message: piece_of_advice
      end
    else
      # ['404', {"Content-Type" => 'text/html', "Content-Length" => '60'},
      #   [erb(:not_found)]
      # ]
      status = '404'
      headers = {"Content-Type" => 'text/html', "Content-Length" => '60'}
      response(status, headers) do
        erb :not_found
      end
    end
  end

  private

end