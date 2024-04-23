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

        if(info_type == "password")
          while true
            print "Enter the new password: "
            new_value = gets.chomp.to_s
            if(UserValidate.validate_password(new_value))
              break
            else
              puts "Password must be at least 8 characters long, contain at least one uppercase letter, one special character, and one digit."
            end
          end
        end


        if (info_type == "email")
          while true
            print "Enter the new email: "
            new_value = gets.chop.to_s
            if(UserValidate.validate_email(new_value))
              check_email = User.search_by_email(new_value)
              if check_email
                puts "Email already exists!"
              else
                break
              end
            else
              puts "Invalid email format !!!"
            end
          end
        end

        if (info_type == "name")
          print "Please enter new name: "
          new_value = gets.chomp.to_s
        end

        if UserController.update_user(id, info_type, new_value)
          puts "User information updated."
        else
          puts "Failed to update user information."
        end

    end
end
