step 'I am logged out' do
  if sign_out_link = first('a[href="/users/sign_out"]')
    sign_out_link.click
  end
end

step 'I am logged in with :email' do |email|
  step 'I am logged out'

  user = FactoryGirl.create(:confirmed_user, email: email)

  visit new_user_session_path

  fill_in 'Email', with: user.email
  fill_in 'user_password', with: 'password'

  click_button 'SIGN IN'
end

step 'the user :email is opted into the newsletter' do |email|
  eventually {
    user = user(email)

    expect(user.newsletter_opt_in).to eq true
  }
end
