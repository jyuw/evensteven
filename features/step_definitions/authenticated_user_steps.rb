Given("the following user exists") do |table|
  table.hashes.each do |user|
   create(:user, user)
  end
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

Then("{string} should be saved in the database") do |email|
  user = User.find_by(email: email)
  expect(user.email).to eq email
end

Then("show me the page") do
  save_and_open_page
end


Then("I should be on the Sign in page") do
  expect(page.current_path).to eq new_user_session_path
end
Then("I should be on the Sign up page") do
  expect(page.current_path).to eq user_registration_path
end

Then("I should see {string} link") do |link_text|
  expect(page).to have_content link_text
end
