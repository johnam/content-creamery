# @registration
# Feature: Visitor registers
#   Background:
#     Given I am logged out
#     And I am on the registration page

#   Scenario: Default opt in to newsletter
#     When I register with 'bob@example.com'
#     Then there is a new user for 'bob@example.com'
#     And 'bob@example.com' is opted 'in to' the newsletter

#   Scenario: Opts out of newsletter
#     When I register with 'bob2@example.com' and opt out of the newsletter
#     Then there is a new user for 'bob2@example.com'
#     And 'bob2@example.com' is opted 'out of' the newsletter

#   Scenario: Views email confirmation notification
#     When I register with 'bob3@example.com'
#     Then I see an email confirmation notification

#   Scenario: Password does not match confirmation
#     When I register with 'bob4@example.com' with an incorrect password confirmation
#     Then I see a password confirmation error message

#   Scenario: Duplicate registration
#     When I register twice with 'bob5@example.com'
#     Then I see a duplicate registration error message