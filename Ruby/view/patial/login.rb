require 'bcrypt'
load './controller/users_controller.rb'

def login_user
  puts "Welcome to login !!!"
  while true
    print "Enter your email address: "
    email = gets.chomp.to_s
    check_email = User.search_by_email(email)
    if check_email
      break
    else
      puts "Not found email address !!!"
    end
  end

  while true
    print "Please enter your password: "
    password = gets.chomp.to_s
    check_password = User.check_password(email, password)
    if check_password
      puts "Login successful"
      break
    else
      puts"Login failed, please try again..."
    end
  end


end
