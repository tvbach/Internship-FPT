require 'json'
require 'bcrypt'

class User
  attr_accessor :user_params

  def initialize(user_params)
    @user_params = user_params
  end

  class << self
    def search_by_id(id)
      users = read_file
      user = users.find { |user| user['id'] == id }
    end

    def search_by_email(email)
      users = read_file
      user = users.find { |user| user['email'] == email }
    end

    def check_password(email, password)
      user = search_by_email(email)
      if user
        bcrypt_password = BCrypt::Password.new(user['password'])
        return user['password'] == bcrypt_password
      end
      return false
    end

    def read_file
      JSON.parse(File.read('users.json'))
    end

    def write_file(new_users)
      File.write('users.json', JSON.pretty_generate(new_users))
    end
  end

  def save_user
    users = self.class.read_file
    users = users.push user_params
    self.class.write_file(users)
  end

  def update_info_user(info_type, new_value)
    users = self.class.read_file
    index = users.find_index { |user| user['id'] == user_params['id'] }
    if index
      users[index][info_type] = new_value
      self.class.write_file(users)
      true
    else
      false
    end
  end

  def delete_user
    users = self.class.read_file
    index = users.find_index { |user| user['id'] == user_params['id'] }
    if index
      users.delete_at(index)
      self.class.write_file(users)
      true
    else
      false
    end
  end
end
