Feature: Visitor should be able to sign up / login with Facebook.
  As a visitor
  in order to ease my registration/login process
  I'd like to be able to authenticate with Facebook

  Scenario: visitor signs up with Facebook OmniAuth
    Given I visit the site
    And I click on "Sign in with Facebook"
    Then I am on the "Dashboard" page
    Then show me the page
    And I should see "Successfully authenticated from Facebook account"
    And my account should state that I signed up with Facebook
