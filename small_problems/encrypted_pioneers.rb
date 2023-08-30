LETTERS = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z) * 2
CAPS = LETTERS.map(&:upcase)
ENCRYPTED_NAMES = [
'Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu'
]
# p ENCRYPTED_NAMES
# p DOUBLED_LETTERS
p CAPS

def decipher(word)
  output = []
  word.chars.each do |char|
    if char =~ /\W/
      output << char
    elsif LETTERS.include?(char)
      output << LETTERS[LETTERS.index(char) + 13]
    else
      output << CAPS[CAPS.index(char) + 13]
    end
  end
  output.join("")
end

deciphered = ENCRYPTED_NAMES.map { |encrypted| decipher(encrypted)}
puts deciphered