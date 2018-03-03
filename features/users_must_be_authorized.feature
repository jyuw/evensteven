Feature: A visitor must be logged in before accessing application functions
  As a user
  In order to understand that I must be logged in before using the site
  I would like to be redirected to the login page if I access an unauthorized page

Background:
  Given the following group exists
    | name         | description |
    | Holgers trip | Paris       |

Scenario: Visitor who is not registered or logged in tries to access dashboard
  Given I try to visit the 'Dashboard' page
  Then I should be on the 'Sign in' page
  And I should see 'You need to sign in or sign up before continuing.'

Scenario: Visitor who is not registered or logged in tries to access groups
  Given I try to visit the 'Holgers trip' page
  Then I should be on the 'Sign in' page
  And I should see 'You need to sign in or sign up before continuing.'
