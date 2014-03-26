require 'spec_helper'

describe User do
  context 'password' do
    it 'is valid with a password' do
      expect(new_user).to be_valid
    end

    it 'is invalid without a password' do
      user = new_user(password: '', password_confirmation: '')

      expect(user).not_to be_valid
    end
  end

  context 'email' do
    it 'valid with a good email' do
      expect(new_user).to be_valid
    end

    it 'invalid without a email' do
      user = new_user(email: '')

      expect(user).not_to be_valid
    end

    it 'invalid with a bad email' do
      user = new_user(email: 'bad email')

      expect(user).not_to be_valid
    end

    it 'invalid if email is not unique' do
      create_user(email: 'adam@example.com')
      user = new_user(email: 'adam@example.com')

      expect(user).not_to be_valid
    end
  end
end
