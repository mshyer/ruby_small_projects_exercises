def cleanup(sentence)
  #arr = sentence.split(" ").map {|word| word.delete('^a-zA-Z ')}
  #p arr.join(" ").squeeze(" ")
  sentence.gsub(/[^a-z]/, ' ').squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '