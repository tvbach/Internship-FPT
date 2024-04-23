require 'bcrypt'

print "Nhập password: "
password = gets.chomp.to_s

hashed_password = BCrypt::Password.create(password)
bcrypt_password = BCrypt::Password.new(hashed_password)

puts "Check: #{hashed_password}"
puts "Check: #{bcrypt_password}"

if(bcrypt_password == password)
  puts "Password correct"
else
  puts "Password incorrect"
end
