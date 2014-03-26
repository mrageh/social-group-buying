module ObjectCreationMethods
  def new_user(overrides = {})
    User.new({
      email: 'Adam@example.com',
      password: 'password1',
      password_confirmation: 'password1'
    }.merge(overrides))
  end

  def create_user(overrides = {})
    new_user(overrides).tap(&:save)
  end

  private

  def counter
    @counter ||= 0
    @counter += 1
  end
end
