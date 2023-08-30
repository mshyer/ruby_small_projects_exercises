class Banner
  def initialize(message, width = message.length)
    @message = message
    if width >= message.length && width <= 150
      @width = width
    else
      @width = message.length
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{"-" * @width}-+"
  end

  def empty_line
    "| #{" " * @width} |"
  end

  def message_line
    "| #{@message.center(@width)} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 15)
puts banner

# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('', 50)
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

banner = Banner.new('monkey breath', 200)
puts banner