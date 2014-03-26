require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid credentials' do
    sign_up_with 'Adam@example.com', 'password1'

    expect(page).to have_content I18n.t('flashes.success_after_create')
  end

  scenario 'tries with invalid email' do
    sign_up_with 'adam.com', 'password1'

    expect(page).to have_content 'Email is invalid'
  end

  scenario 'tries with blank password fields' do
    sign_up_with 'adam.com', ''

    expect(page).to have_content "Password can't be blank"
  end
end
