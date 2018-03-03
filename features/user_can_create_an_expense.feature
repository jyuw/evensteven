Feature: In order to split bill I want to be able to add an expense
  As a user
  In order to know how much money should be split
  I would like to be able to add an expense

  Background:
    Given the following user exists
      | email        |
      | jade@ca.com  |
      | faraz@ca.com |
      | david@ca.com |
    And the following group exists
      | name         | description |
      | Holgers trip | Paris       |
    And the users are members of the following group
      | email        | group        |
      | jade@ca.com  | Holgers trip |
      | faraz@ca.com | Holgers trip |
    And I am logged in as "faraz@ca.com"

  Scenario: User is able to add expense
    Given I am on the "Holgers trip" page
    When I fill in "Description" with "Dinner"
    And I fill in "Amount" with "300"
    And I click on "Add expense"
    Then I should see "faraz@ca.com paid 300kr for Dinner"
