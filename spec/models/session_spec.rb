require 'spec_helper'

describe Session do
  describe '.new' do
    it 'can be created with options' do
      session = Session.new(email: 'test@example.com', password: 'secret')

      expect(session.email).to eq 'test@example.com'
      expect(session.password).to eq 'secret'
    end
  end

  describe '#user' do
    context 'with a valid email address and password' do
      it 'returns a user' do
        user = create_user(
          email: 'test@example.com',
          password: 'secret',
          password_confirmation: 'secret'
        )
        session = Session.new(email: 'test@example.com', password: 'secret')

        expect(session.user).to eq user
      end
    end

    context 'with a valid email address and a bad password' do
      it 'returns false' do
        create_user(
          email: 'test@example.com',
          password: 'secret',
          password_confirmation: 'secret'
        )
        session = Session.new(email: 'test@example.com', password: 'love')

        expect(session.user).to be_false
      end
    end

    context 'with a bad email address' do
      it 'returns nil' do
        session = Session.new(
          email: 'nosuchuser@example.com',
          password: 'whatever'
        )

        expect(session.user).to be_nil
      end
    end
  end
end
