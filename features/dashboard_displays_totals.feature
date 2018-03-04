Feature: User can see totals from all groups on dashboard
  As a user
  In order to easily see results from each group
  I would like to be able see the output on the dashboard

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
      | thomas@ca.com | Holgers trip |
    And the following expenses have been added
      | email        | description  | amount | group        |
      | david@ca.com | motorcycles  | 2000   | Holgers trip |
      | david@ca.com | salt shakers | 500    | Holgers trip |
      | faraz@ca.com | Eiffel Tower | 600    | Holgers trip |
      | jade@ca.com  | cheese       | 1000   | Holgers trip |
    And I am logged in as "jade@ca.com"

  Scenario: User is on dashboard and can see results from every group
    Given I am on the "Holgers trip" page
    When I fill in "Description" with "wine"
    And I fill in "Amount" with "300"
    And I click on "Add expense"
    Then I am on the "Dashboard" page
    And I should see "Holgers trip Summary"
    And I should see "faraz@ca.com owes david@ca.com 500.0kr"
    And I should see "thomas@ca.com owes david@ca.com 900.0kr"
    And I should see "thomas@ca.com owes jade@ca.com 200.0kr"
