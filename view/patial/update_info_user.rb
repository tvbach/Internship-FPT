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

def choice_info_update
    id = search_by_id_user

    if id
      print "Which information do you want to update? (name, password, email): "
        info_type = gets.chomp.downcase
        print "Enter the new value: "
        new_value = gets.chomp.to_s
        if UserController.update_user(id, info_type, new_value)
          puts "User information updated."
        else
          puts "Failed to update user information."
        end
    end
end
