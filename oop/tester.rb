class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  # def copy(target_file_name)
  #   target_file = self.class.new(target_file_name)
  #   target_file.write(read)

  #   target_file
  # end

  # def to_s
  #   "#{name}.#{self.class::FORMAT}"
  # end
end

aa = File.new("afile.rb")
p aa.read