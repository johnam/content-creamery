FactoryGirl.define do
  factory :user do
    email
    password              'password'
    password_confirmation 'password'
  end

  factory :confirmed_user, parent: :user do
    confirmed_at Time.now
  end
end