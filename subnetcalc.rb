#!/usr/bin/ruby
require 'date'
input = ARGV[0]

def cidr_to_subnet(slash)
slash = slash.delete "/"
slash = slash.to_i
if slash <=8 
 return "#{slash*32-1}.0.0.0"
elsif slash<=16
 return "255.#{(slash/2)*32-1}.0.0" 
elsif slash<=24
 return "255.255.#{(slash/3)*32-1}.0"
elsif slash<=32
 return "255.255.255.#{(slash/4)*32-1}"
end
end

if input.start_with?('/')
result = cidr_to_subnet(input)
end

puts result
