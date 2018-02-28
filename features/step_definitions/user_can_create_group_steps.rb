Given(/^I am logged in as "([^"]*)"$/) do |email|
  user = User.find_by(email: email)
  login_as(user, scope: :user)
end

When("I select {string} from {string}") do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end
