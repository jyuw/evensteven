Feature: Visitor should be able to sign up / login with Facebook.
  As a visitor
  in order to ease my registration/login process
  I'd like to be able to authenticate with Facebook

  Scenario: Visitor signs up with Facebook OmniAuth
    Given I visit the site
    And I click on "Sign in with Facebook"
    And I should see "Successfully authenticated from Facebook account"
    And my account should state that I signed up with Facebook

  #Sad path
  Scenario: Visitor tries to Sign-up with Facebook but doesn't have a fb-account
    Given I visit the site
    And I don't have an account with "david@test.se" connected to facebook
    And I click on "Sign in with Facebook"
    Then I should be redirected to the landing page
