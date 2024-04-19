load './controller/users_controller.rb'
load './validation/user_validate.rb'

def cin_info_users
  print "Nhap id: "
  id = gets.chomp.to_i

  print "Nhap name: "
  name = gets.chomp

  while true
    print "Nhap password: "
    password = gets.chomp
    if UserValidate.validate_password(password)
      break
    else
      puts "Password must be at least 8 characters long, contain at least one uppercase letter, one special character, and one digit."
    end
  end

  while true
    print "Nhap email: "
    email = gets.chomp
    if UserValidate.validate_email(email)
      break
    else
      puts "Invalid email format."
    end
  end

  user_params = {id: id, name: name, email: email, password: password}
  UserController.create(user_params)
end
