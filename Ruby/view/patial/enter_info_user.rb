require 'bcrypt'
load './controller/users_controller.rb'
load './validation/validate_user.rb'

def create_hash(password)
  BCrypt::Password.create(password)
end

def cin_info_users
  while true
    print "Nhap id: "
    id = gets.chomp.to_i
    check_id = User.search_by_id(id)
    if check_id
      puts "ID already exists !!!"
    else
      break
    end
  end

  print "Nhap name: "
  name = gets.chomp

  while true
    print "Nhap password: "
    password = gets.chomp
    if UserValidate.validate_password(password)
      password = create_hash(password)
      break
    else
      puts "Password must be at least 8 characters long, contain at least one uppercase letter, one special character, and one digit !!!"
    end
  end

  while true
    print "Nhap email: "
    email = gets.chomp
    if UserValidate.validate_email(email)
      check_email = User.search_by_email(email)
      if check_email
        puts "Email already exists !!!"
      else
        break
      end
    else
      puts "Invalid email format !!!"
    end
  end

  user_params = {id: id, name: name, email: email, password: password}
  UserController.create(user_params)
end
