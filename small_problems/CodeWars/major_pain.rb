=begin
method takes a STRING of notes and returns what scale it is
-if not a major scale, puts "no major scale", otherwise "? major scale"

"D# B C# A B G# A F# E"
Possible: C, C#, D, D#, E, F, F#, G, G#, A, A#, B
Distance      2   2   1   2   2   2   1

Algorithm:
init NOTES CONSTANT array
init scales empty hash
1. get the right notes
  Split string into characters
  Add the characters PLUS SHARPS to a new array
2. generate every scale and put into hash
  a. for each POSSIBLE char
    b. add char as key to Hash
  b. possible chars cycle 24
    -index = starting at the index of Char
    -append cycled chars to hash array value
3. check if the right notes sorted match any of the scales
4. return the hash key
5. put it into an output string.


=end
NOTES = %w(C C# D D# E F F# G G# A A# B)




def init_scale(key, hsh)
  cycle = NOTES.cycle.first(24)
  index = cycle.index(key)
  hsh[key] << cycle[index]
  hsh[key] << cycle[index + 2]
  hsh[key] << cycle[index + 4]
  hsh[key] << cycle[index + 5]
  hsh[key] << cycle[index + 7]
  hsh[key] << cycle[index + 9]
  hsh[key] << cycle[index + 11]
  hsh[key] << cycle[index + 12]
end



def major_scale(melody)
  scales = {}
  NOTES.each do |key|
    scales[key] = []
    init_scale(key, scales)
  end

  raw_chars = melody.chars
  chars = []
  raw_chars.each_with_index do |raw, idx|
    if raw_chars[idx + 1] == "#"
      chars << "#{raw}#"
    elsif raw == "#"
      next
    else
      chars << raw
    end
    #p chars
  end
  skey = 'No'
  scales.each do |key, value|
    if chars.sort.uniq == value.sort.uniq
      skey = key
    end
  end
  puts "#{skey} major scale"
end

major_scale("CBCACGCFCECDC")
major_scale("F#D#A#BC#D#BD#EBG#A#B")