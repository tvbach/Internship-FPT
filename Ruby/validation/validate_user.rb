class UserValidate
  class << self
    def validate_email(email)
      email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      email =~ email_regex
    end

    def validate_password(password)
      if password.length < 8
        return false
      end

      unless password.match?(/[A-Z]/) && password.match?(/[!@#\$%^&*()\\-_+=~`\\[\\]{}|:;"'<>,.?]/) && password.match?(/\d/)
        return false
      end
      return true
    end

  end

end
