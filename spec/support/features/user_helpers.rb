module Features
  def sign_up_with(email, password)
    visit sign_up_path

    fill_in 'Name', with: 'Adam'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_on I18n.t('button.user.create')
  end

  def sign_in_with(email, password)
    visit sign_in_path

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on I18n.t('button.sign_in')
  end
end
