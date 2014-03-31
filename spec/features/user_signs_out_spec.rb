require 'spec_helper'

feature 'User signs out' do
  scenario 'after signing in' do
    user = create_user(
      name: 'Adam',
      email: 'test@example.com',
      password: 'secret',
      password_confirmation: 'secret'
    )

    sign_in_with('test@example.com', 'secret')
    click_on I18n.t('button.sign_out')

    expect(page).to have_text I18n.t('flashes.successfully_signed_out')
    expect(page).not_to have_text I18n.t('signed_in_as', name: user.name)
  end
end
