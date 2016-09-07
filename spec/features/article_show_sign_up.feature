Feature: Visitor signs up for newsletter from article show page
  Background:
    Given I am logged out
    And there is an article
    And I am viewing the article

  Scenario: New sign up
    When I sign up for the newsletter with 'bob@example.com'
    Then one new sign up is in the database for 'bob@example.com'

  Scenario: Provide demographic data
    Given I sign up for the newsletter with 'bob2@example.com'
    And I provide demographic data
    Then one new sign up is in the database with demographic data for 'bob2@example.com'

  Scenario: Duplicate sign up
    When I sign up for the newsletter twice on an article page with 'bob3@example.com'
    Then one new sign up is in the database for 'bob3@example.com'