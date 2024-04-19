load './view/patial/enter_info_user.rb'
load './view/patial/update_info_user.rb'
load './view/patial/dele_info_user.rb'

def display_menu
  puts "Welcome to the Ruby Menu"
  puts "1. Add user"
  puts "2. Update user"
  puts "3. Delete user"
  puts "4. Exit"
end

def display_menu_bar
  loop do
    display_menu

    print "Please enter your choice: "
    choice = gets.chomp.to_i

    case choice

    when 1
      puts "You selected Option Add user"
      cin_info_users
      print "Add user successfull\n"

    when 2
      puts "You selected Option Update user"
      choice_info_update
    when 3
      puts "You selected Option Delete user"
      dele_info_user
    when 4
      puts "Exiting the program. Goodbye!"
      break

    else
      puts "Invalid choice. Please select a number between 1 and 4."
    end

    puts "Press Enter to continue..."
    gets
    system "clear" or system "cls"
  end
end
