Feature: User is sent to a dashboard where they can create or join a group.
  As a user
  In order to understand what functions are available to me as a new user
  I would like to see a welcome page with directions of what to do next

  Background:
    Given the following user exists
      | email     | password    | password_confirmation |
      | jf@ca.com | password123 | password123           |
    And I am on the "Landing" page

  Scenario: User signs up and is sent to dashboard page
    Given I click on "Register"
    When I fill in "Email" with "hacker@holger.com"
    And I fill in "Password" with "password12"
    And I fill in "Password confirmation" with "password12"
    And I click on "Sign up"
    Then I should see "Hello, hacker@holger.com"
    And I should see "Create a group" link
