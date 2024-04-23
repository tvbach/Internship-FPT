load './model/user.rb'

class UserController
  class << self
    def create(user_params)
      User.new(user_params).save_user
    end

    def update_user(id, info_type, new_value)
      user = User.new('id' => id)
      if user.update_info_user(info_type, new_value)
        return true
      else
        return false
      end
    end

    def delete_user(id)
      user = User.new('id' => id)
      if user.delete_user
        return true
      else
        return false
      end
    end

  end
end
