class Session
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :email, :password

  def initialize(options = {})
    @email = options[:email]
    @password = options[:password]
  end

  def persisted?
    false
  end

  def user
    if user = User.find_by(email: email)
      user.authenticate(password)
    end
  end
end
