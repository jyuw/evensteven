Given("I am logged in as {string}") do |email|
  user = User.find_by(email: email)
  login_as(user, scope: :user)
end

When("I select {string} from {string}") do |email, friends|
  select(email, from: friends)
end

Then("I should be on {string} Group page") do |group_name|
  group = Group.find_by(name: group_name)
  visit group_path(group.id)
end

