Feature: User is authenticated for both sign up and login.
  As a user
  In order to access the site
  We need to be able to sign up or log in


  Background:
    Given the following user exists
      |  email    | password    | password_confirmation |
      | jf@ca.com | password123 | password123           |

  Scenario: User signs up for an account
    Given I am on the "Landing" page
    When I click on "Sign up"
    And I fill in "Email" with "hacker@holger.com"
    And I fill in "Password" with "password12"
    And I fill in "Password confirmation" with "password12"
    And I click on "Create account"
    Then I should see the message "Welcome! You have signed up successfully."
    Then "hacker@holger.com" should be saved in the database

  Scenario: User logs in from an existing account
    Given I am on the "Landing" page
    When I click on "Login"
    And I fill in "Email" with "jf@ca.com"
    And I fill in "Password" with "password123"
    And I click on "Log in"
    Then I should see the message "Signed in successfully."
