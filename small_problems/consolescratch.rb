require 'io/console'

class ConsoleInteraction
  def initialize(args)
    @args = args
  end

  def run
    puts "list all expenses? y/n"
    user_r = $stdin.getch

    if user_r.downcase == 'y'
      @args.each do |arg|
        p arg
      end
    else
      puts "whoops"
    end
  end
end

ConsoleInteraction.new(ARGV).run