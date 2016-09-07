steps_for :homepage_signed_in do

  step ':email is opted :in_to_or_out_of the newsletter' do |email, in_to_or_out_of|
    user = user(email)

    state = to_boolean(in_to_or_out_of)
    user.update_attribute(:newsletter_opt_in, state)
  end

  step 'I see the newsletter sign up form' do
    expect(page).to have_css('#New-Sign-Up')
  end

  step 'I do not see the newsletter sign up form' do
    expect(page).to_not have_css('#New-Sign-Up')
  end

end