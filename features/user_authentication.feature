Feature: User is authenticated for both sign up and login.
  As a user
  In order to access the site
  I would like to be able to sign up or log in

  Background:
    Given the following user exists
      | email     | password    | password_confirmation |
      | jf@ca.com | password123 | password123           |
    And I am on the "Landing" page

  Scenario: User signs up for an account
    Given I click on "Register"
    When I fill in "Email" with "hacker@holger.com"
    And I fill in "Password" with "password12"
    And I fill in "Password confirmation" with "password12"
    And I click on "Sign up"
    Then I should see "Welcome! You have signed up successfully."
    Then "hacker@holger.com" should be saved in the database

  Scenario: User logs in from an existing account
    Given I click on "Login"
    When I fill in "Email" with "jf@ca.com"
    And I fill in "Password" with "password123"
    And I click on "Log in"
    Then I should see "Signed in successfully."

  #Sad paths
  Scenario: User fails to enter password confirmation correctly
    Given I click on "Register"
    When I fill in "Email" with "hacker@holger.com"
    And I fill in "Password" with "password12"
    And I fill in "Password confirmation" with "password"
    And I click on "Sign up"
    Then I should see "Password confirmation doesn't match"
    And I should be on the "Sign up" page

  Scenario: User fails to enter email field
    Given I click on "Register"
    And I fill in "Password" with "password12"
    And I fill in "Password confirmation" with "password12"
    And I click on "Sign up"
    Then I should see "Email can't be blank"
    And I should be on the "Sign up" page

  Scenario: User logs in from an account that doesn't exist
    Given I click on "Login"
    When I fill in "Email" with "david@ca.com"
    And I fill in "Password" with "password123"
    And I click on "Log in"
    Then I should see "Invalid Email or password."
    And I should be on the "Sign in" page
