ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
double = ALPHABET * 2
def rot13(string)
  chars = string.chars
  chars.map! do |char|
    if ALPHABET.include?(char)
      double[double.index(char) + 13]
    else
      char
    end
  end
  chars.join("")
end

p rot13("abcd")