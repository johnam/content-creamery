step 'I sign up for the newsletter with :email' do |email|
  fill_in('Email', with: email)
  click_button 'RECEIVE PERIODICAL'
end

step 'one new sign up is in the database for :email' do |email|
  eventually {
    sign_up = sign_up(email)

    expect(sign_up).to be_present
  }
end

step 'I sign up for the newsletter twice with :email' do |email|
  step "I sign up for the newsletter with '#{email}'"
  step 'I am on the homepage'
  step "I sign up for the newsletter with '#{email}'"
end

step 'I provide demographic data' do
  fill_in('Age', with: SIGN_UP[:age])
  fill_in('Gender', with: SIGN_UP[:gender])
  click_button 'SEND'
end

step 'one new sign up is in the database with demographic data for :email' do |email|
  eventually {
    sign_up = sign_up(email)

    expect(sign_up.age).to eq  SIGN_UP[:age]
    expect(sign_up.gender).to eq SIGN_UP[:gender]
  }
end