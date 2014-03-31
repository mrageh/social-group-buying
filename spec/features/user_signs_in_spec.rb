require 'spec_helper'

feature 'User signs in' do
  scenario 'with valid credentials' do
    user = create_user(
      name: 'Adam',
      email: 'test@example.com',
      password: 'secret',
      password_confirmation: 'secret'
    )

    visit root_path
    click_link 'Sign in'

    sign_in_with('test@example.com', 'secret')

    expect(page).to have_text I18n.t('flashes.successfully_signed_in')
    expect(page).to have_text I18n.t('signed_in_as', name: user.name)
  end

  scenario 'with invalid credentials' do
    create_user(
      name: 'Adam',
      email: 'test@example.com',
      password: 'secret',
      password_confirmation: 'secret'
    )

    visit root_path
    click_link 'Sign in'

    sign_in_with('invalid@example.com', 'invalidpassword')

    expect(page).to have_text I18n.t('flashes.invalid_sign_in_details')
  end
end
