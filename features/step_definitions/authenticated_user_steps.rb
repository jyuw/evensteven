Given("the following user exists") do |table|
  table.hashes.each do |user|
   create(:user, user)
  end
end

Given("I try to visit the {string} page") do |page_name|
  visit page_path(page_name)
end

When("I click on {string}") do |link_name|
  click_link_or_button link_name
end

When("I fill in {string} with {string}") do |field, value|
  fill_in(field, with: value)
end

Then("I should see {string}") do |message|
  expect(page).to have_content message
end

Then("{string} should be saved in the database") do |email|
  user = User.find_by(email: email)
  expect(user.email).to eq email
end

Then("show me the page") do
  save_and_open_page
end

Then("I should be on the {string} page") do |path_name|
  expect(page.current_path).to eq page_path(path_name)
end

Then("I should see {string} link") do |link_text|
  expect(page).to have_content link_text
end

Given("I am on the {string} page") do |path_name|
  visit page_path(path_name)
end

Given("I have incorrect credentials") do
  OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
end

Then("my account should state that I signed up with Facebook") do
  user = User.last
  expect(user.provider).to eq 'facebook'
end

def page_path(path_name)
 path = if path_name == 'Sign in'
          new_user_session_path
        elsif path_name == 'Sign up'
          user_registration_path
        elsif path_name == 'Landing'
          root_path
        elsif path_name == 'Dashboard'
          dashboard_path
        elsif path_name == 'Holgers trip'
          group_id = Group.find_by(name: path_name)
          group_path(group_id)
        else
          raise " #{path_name} does not exist"
        end
end
