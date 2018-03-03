Feature: User visits the site and is greeted by a landing page
  As a user
  in order to be able to access the signup page
  I would like to see a landing page

Scenario: User visits site
  Given I am on the "Landing" page
  Then I should see "Even Steven"
  And I should see "The easiest way to split your bills and pay your friends."
