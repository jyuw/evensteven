Feature: Visitor should be able to sign up / login with Facebook.
  As a visitor
  in order to ease my registration/login process
  I'd like to be able to authenticate with Facebook

  Scenario: Visitor signs up with Facebook OmniAuth
    Given I visit the site
    And I click on "Sign in with Facebook"
    And I should see "Successfully authenticated from Facebook account"
    And my account should state that I signed up with Facebook
