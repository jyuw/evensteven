Feature: User should be able to create a group.
  As a user
  In order to start using the application
  I would like to be able to create a group

  Background:
    Given the following user exists
      | email        | password    |
      | jade@ca.com  | password123 |
      | faraz@ca.com | password123 |
      | david@ca.com | password123 |
    And I am logged in as "faraz@ca.com"
    And I am on the "Dashboard" page

  Scenario: user creates a group
    Given I click on "Create a group"
    And show me the page
    When I fill in "Name" with "Holgers trip"
    And I fill in "Description" with "Spain"
    And I select "jade@ca.com" from "Friends"
    And I click on "Add Member"
    And I click on "Create group"
    Then I should be on "Holgers trip" Group page
    And I should see the text "Holgers trip"
    And I should see the text "Spain"
    And I should see the text "jade@ca.com"
