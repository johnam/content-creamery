# @homepage_signed_in
# Feature: Signed in User views homepage

#   Scenario: Opted in to newsletter
#     Given I am logged in with 'a@b.com'
#     When 'a@b.com' is opted 'in to' the newsletter
#     And I am on the homepage
#     Then I do not see the newsletter sign up form

#   Scenario: Opted out of newsletter
#     Given I am logged in with '2a@b.com'
#     When '2a@b.com' is opted 'out of' the newsletter
#     And I am on the homepage
#     Then I see the newsletter sign up form