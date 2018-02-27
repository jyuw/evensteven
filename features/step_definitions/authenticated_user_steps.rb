Given("the following user exists") do |table|
  table.hashes.each do |user|
    FactoryBot.create(:user, user)
  end
end

Given("I am on the {string} page") do |string|
  visit root_path
end

When("I click on {string}") do |link_name|
  click_link_or_button link_name
end

When("I fill in {string} with {string}") do |field, value|
  fill_in(field, with: value)
end

Then("I should see the message {string}") do |message|
  expect(page).to have_content message
end

Then("show me the page") do
  save_and_open_page
end
