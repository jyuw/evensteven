Feature: User should be able to create a group.
  As a user
  in order to start using the application
  I would like to be able to create a group with members

  Background:
    Given the following user exists
      | email        |
      | jade@ca.com  |
      | faraz@ca.com |
      | david@ca.com |
    And I am logged in as "faraz@ca.com"
    And I am on the "Dashboard" page

  Scenario: User creates a group
    Given I click on "Create a group"
    When I fill in "Name" with "Holgers trip"
    And I fill in "Description" with "Spain"
    And I select "jade@ca.com" from "friends"
    And I select "david@ca.com" from "friends"
    And I click on "Create group"
    Then I should be on "Holgers trip" Group page
    And I should see "Holgers trip"
    And I should see "Spain"
    And I should see "jade@ca.com"
    And I should see "faraz@ca.com"
