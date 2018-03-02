Feature: Expenses are split between all members of the group
  As a user
  in order to know how much money is owed
  there needs to be a formula that calculates the amounts owed

  Background:
    Given the following user exists
      | email         |
      | jade@ca.com   |
      | faraz@ca.com  |
      | david@ca.com  |
      | thomas@ca.com |
      | magnus@ca.com |
    And the following group exists
      | name         | description |
      | Holgers trip | Paris       |
    And the users are members of the following group
      | email        | group        |
      | jade@ca.com  | Holgers trip |
      | faraz@ca.com | Holgers trip |
      | david@ca.com | Holgers trip |
    And the following expenses have been added
      | email        | description  | amount | group        |
      | david@ca.com | motorcycles  | 2000   | Holgers trip |
      | faraz@ca.com | Eiffel Tower | 600    | Holgers trip |
      | jade@ca.com  | cheese      | 1000   | Holgers trip |
    And I am logged in as "jade@ca.com"

  Scenario:
    Given I am on the "Holgers trip" page
    Then I should see "faraz@ca.com paid 600kr for Eiffel Tower"
    And I should see "david@ca.com paid 2000kr for motorcycles"
    And I should see "jade@ca.com paid 1000kr for cheese"
    And I should see "faraz@ca.com owes david@ca.com 600"
    And I should see "jade@ca.com owes david@ca.com 200"
    And I should see "Total expenses per person: 1200kr"


  Scenario:
    Given I am on the "Holgers trip" page
    When I fill in "Description" with "wine"
    And I fill in "Amount" with "300"
    And I click on "Add expense"
    And I should see "faraz@ca.com owes david@ca.com 700"
    And I should see "Total expenses per person: 1300kr"
