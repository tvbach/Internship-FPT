def search_by_id_user
  print "Enter user ID: "
  id = gets.chomp.to_i

  user = User.search_by_id(id)

  if user
    puts "Information user:"
    puts "ID: #{user['id']}"
    puts "Name: #{user['name']}"
    puts "Email: #{user['email']}"
    return id
  else
    puts "User not found! Press Enter to continue..."
    gets.chomp
    return nil
  end
end

def dele_info_user
    id = search_by_id_user
    if UserController.delete_user(id)
      puts "User deleted! Press Enter to continue..."
    else
      puts "User deleted! Press Enter to continue..."
    end
end
