load './controller/users_controller.rb'
load './model/user.rb'
load './view/menu.rb'
load './validation/validate_user.rb'
load './view/patial/enter_info_user.rb'

display_menu_bar



# mã hóa password khi tạo user = thư viện bcrypt (done), tìm hiểu cách hoạt động của thư viện (done)
# tạo màn hình đăng nhập --> nhập info user(email, password) --> validate --> thông báo
