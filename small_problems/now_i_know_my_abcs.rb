BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(word)
  blocks_dup = BLOCKS.dup
  char_arr = word.upcase.chars
  char_arr.each do |char|
    blocks_dup.each do |block|
      if block.chars.include?(char)
        blocks_dup.delete(block)
      end
    end
  end
  BLOCKS.length - blocks_dup.length == word.length ? true : false
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true