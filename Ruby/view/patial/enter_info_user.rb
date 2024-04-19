load './controller/users_controller.rb'

def cin_info_users
  print "Nhap id: "
  id = gets.chomp

  print "Nhap name: "
  name = gets.chomp

  print "Nhap password: "
  password = gets.chomp

  print "Nhap email: "
  email = gets.chomp

  user_params = {id: id, name: name, email: email, password: password}
  
  UserController.create(user_params)
end
