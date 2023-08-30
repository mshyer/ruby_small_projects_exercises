require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
public_entries = []
# Dir.chdir ("public") do
  public_entries = Dir.glob("public/*.*").map { |file| File.basename(file) }
  public_entries.sort!
# end
# Dir.chdir("/Users/michaelshyer/LaunchSchool/RB175/dynamic_directory_index")
puts public_entries
# public_files = []
# public_entries.each do |entry|
#   public_files << File.basename(entry)
# end
# puts public_files


get '/' do 
  sort = params["sort"]
  @public_entries = public_entries
  if sort == "reverse"
    @public_entries.sort!.reverse!
  else
    @public_entries.sort! 
  end
  erb :home
end

# get '/*.*' do
#   Dir.chdir ("public")
#   filename = params['splat'][0]
#   erb :entries
# end