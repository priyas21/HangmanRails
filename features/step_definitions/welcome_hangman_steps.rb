Given("User is on homepage") do
  visit root_path
end
When("User click on the New Custom Game button") do
  click_button('New Custom Game')
end
When("User click on show all Games link") do
  click_link('Click here to show all Games')
end
Then("User should see {string}") do |content|
  expect(page).to have_content(content)
end
