def types(array)
  yield(array)
end

types(%w(raven finch hawk eagle)) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(", ")}."
end



