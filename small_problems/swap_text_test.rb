require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'swap_text.rb'

class SwapTextTest < Minitest::Test
  def setup
    @file = File.open('sample_text.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    expected_text = <<~TEXT.chomp
    Lorem apsum dolor sat amet, consectetur adapascang elat. Cras sed vulputate apsum.
    Suspendasse commodo sem arcu. Donec a nasa elat. Nullam eget nasa commodo, volutpat
    quam a, vaverra mauras. Nunc vaverra sed massa a condamentum. Suspendasse ornare justo
    nulla, sat amet mollas eros sollacatudan et. Etaam maxamus molestae eros, sat amet dactum
    dolor ornare babendum. Morba ut massa nec lorem tancadunt elementum vatae ad magna. Cras
    et varaus mauras, at pharetra ma.
    TEXT
    swapped = text.swap("i", "a")
     #p swapped
     #p expected_text
    assert_equal(swapped, expected_text)#text.text.gsub("i", "a"))
  end

  def test_word_count
    words = Text.new(@file.read).word_count
    assert_equal(words, 72)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end

end