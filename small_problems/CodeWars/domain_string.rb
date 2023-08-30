=begin
#Function writes a domain name as string. 
#Extracts data from after // and www.
#Extracts data before .
#will have either http// or www. or both
#Data structure: array of prefixes, string
#Algorithm: 
1. Init output str ''
2. create an array of possible prefixes. Can be constant
3. gsub out all of the possible prefixes from string
4. output << split string of "." of zero
=end

def domain_name(url)
  domain = ''
  dup = url.dup
  ["http://", "https://", "www."].each do |prefix|
    dup.gsub!(prefix, "")
  end
  domain << (dup.split("."))[0]
end


p domain_name("http://github.com/carbonfive/raygun") == "github" 
p domain_name("http://www.zombie-bites.com") == "zombie-bites"
p domain_name("https://www.cnet.com") == "cnet"