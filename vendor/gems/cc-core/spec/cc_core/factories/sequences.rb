FactoryGirl.define do
  sequence :email do |x|
    "#{x}@example.com"
  end
end