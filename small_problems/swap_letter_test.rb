require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'swap_letter'

class SwapLetterTest < Minitest::Test
  def setup
    @file = File.open('text.txt')
  end

  def test_swap
    text = Text.new(@file.read)
    heredoc = 
    <<~TEXT.chomp
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum.
    Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat
    quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo
    nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum
    dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras
    et varius mauris, at pharetra mi.
    TEXT

    altered_heredoc = heredoc.gsub("a", "e")
    altered_text = text.swap("a", "e")

    assert_equal altered_heredoc, altered_text
  end

  def test_word_count
    text = Text.new(@file.read)
    assert_equal 72, text.word_count
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end