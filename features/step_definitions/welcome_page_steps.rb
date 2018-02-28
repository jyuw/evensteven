Given("I am on the Landing page") do
  visit root_path
end

Then("I should see the text {string}") do |text|
  expect(page).to have_content text
end
