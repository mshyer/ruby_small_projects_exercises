class TextAnalyzer
  # attr_accessor :file_path, :text

  # def initialize(file_path = nil)
  #   @file_path = file_path
  # end

  # def add_text(file_path = self.file_path)
  #   self.text = File.open(file_path)
  # end

  def process(file_url = 'sample_text.txt')
    file = File.open(file_url)
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new

# analyzer.add_text("sample_text.txt")
analyzer.process { |text| p text.split("\n\n").length }
analyzer.process { |text| p text.split("\n").length }
analyzer.process { |text| p text.split(" ").length }

#Sample output:
# 3 paragraphs
# 15 lines
# 126 words