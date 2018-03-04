Feature: A users groups should be diplayed in the sidebar

  Background:
    Given the following user exists
      | email         | password    | password_confirmation |
      | holger@ca.com | password123 | password123           |
    And the following group exists
      | name         | description |
      | Holgers trip | Paris       |
    And the users are members of the following group
      | email         | group        |
      | holger@ca.com | Holgers trip |

  Scenario: User is logged in and sees his groups
    Given I am logged in as "holger@ca.com"
    And I am on the "Dashboard" page
    Then I should see "Hello, holger@ca.."
    And I should see "Create a group" link
    And I should see "Holgers trip" link
    And I should see "Dashboard" link
