Feature: User is authenticated for both sign up and login.
  As a user
  In order to access the site
  We need to be able to sign up or log in


  Background:
    Given the following user exists
      |  email    | password    | password_confirmation |
      | jf@ca.com | password123 | password123           |

    Scenario:
      Given I am on the "Landing" page
      When I click on "Sign up"
      And I fill in "Email" with "hacker@holger.com"
      And I fill in "Password" with "password12"
      And I fill in "Password confirmation" with "password12"
      And I click on "Sign up"
      Then I should see the message "Welcome! You have signed up successfully."
      Then show me the page
