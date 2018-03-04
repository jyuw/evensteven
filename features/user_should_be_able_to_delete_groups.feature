Feature: User should be able to delete groups


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
    And I am logged in as "faraz@ca.com"


  Scenario: User can delete groups they are members of

    Given I am on the "Holgers trip" page
    Then I should see "Delete Group" link
    And I click on "Delete Group"
    And I should see "Holgers trip was successfully deleted"
