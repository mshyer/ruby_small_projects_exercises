##/\Ahttps?:\/\/.*\.\S+\z
# Matches valid urls

def url?(str)
  !!(str =~ /\Ahttps?:\/\/.*\.\S+\z/) ? true : false

end

p url?('http://launchschool.com')   # -> true
p url?('https://example.com')       # -> true
p url?('https://example.com hello') # -> false
p url?('   https://example.com')    # -> false