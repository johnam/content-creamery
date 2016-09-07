steps_for :registration do

  step 'I am on the registration page' do
    visit new_user_registration_path
  end

  step 'fill in registration form with :email' do |email|
    fill_in 'Email', with: email
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
  end

  step 'I register with :email' do |email|
    step "fill in registration form with '#{email}'"

    click_button 'REGISTER'
  end

  step 'I register with :email and opt out of the newsletter' do |email|
    step "fill in registration form with '#{email}'"
    # uncheck('Receive the periodical')
    # find('#user_newsletter_opt_in', visible: false).set false
    execute_script "$('#user_newsletter_opt_in').click()"

    click_button 'REGISTER'
  end

  step 'there is a new user for :email' do |email|
    eventually {
      user = user(email)

      expect(user).to be_present
    }
  end

  step ':email is opted :in_to_or_out_of the newsletter' do |email, in_to_or_out_of|
    state = to_boolean(in_to_or_out_of)

    eventually {
      user = user(email)

      expect(user.newsletter_opt_in).to eq state
    }
  end

  step 'I see an email confirmation notification' do
    expect(page).to have_content <<-eos
      A message with a confirmation link has been sent to your email address. 
      Please follow the link to activate your account.
    eos
  end

  step 'I register with :email with an incorrect password confirmation' do |email|
    fill_in 'Email', with: email
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'passwordzzz'

    click_button 'REGISTER'
  end

  step 'I see a password confirmation error message' do
    expect(page).to have_content <<-eos
      Password confirmation doesn't match Password
    eos
  end

  step 'I register twice with :email' do |email|
    step "I register with '#{email}'"
    step 'I am on the registration page'
    step "I register with '#{email}'"
  end

  step 'I see a duplicate registration error message' do
    expect(page).to have_content <<-eos
      Email has already been taken
    eos
  end

end