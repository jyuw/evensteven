Feature: User should be able to delete groups
  As a user
  In order to keep my groups tidy
  I would like to be able to delete unused groups


  Background:
    Given the following user exists
      | email         |
      | jade@ca.com   |
      | faraz@ca.com  |
      | david@ca.com  |
      | thomas@ca.com |
      | magnus@ca.com |
    And the following group exists
      | name         | description | owner        |
      | Holgers trip | Paris       | faraz@ca.com |
    And the users are members of the following group
      | email        | group        |
      | jade@ca.com  | Holgers trip |
      | faraz@ca.com | Holgers trip |
    And I am logged in as "faraz@ca.com"


  Scenario: User can delete groups they are the owner of
    Given I am logged in as "faraz@ca.com"
    And I am on the "Holgers trip" page
    Then I should see "Delete Group" link
    And I click on "Delete Group"
    And I should see "Holgers trip was successfully deleted"


  Scenario: User is not the owner of the group
    Given I am logged in as "jade@ca.com"
    And I am on the "Holgers trip" page
    Then I should see "Delete Group" link
    And I click on "Delete Group"
    And I should see "Only faraz@ca.com can delete this group"

