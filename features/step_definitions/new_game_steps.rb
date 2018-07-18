Given("User is on new game page") do
  visit new_game_path
end
When("User fills in {string} with {string}") do |field, value|
  fill_in(field, :with => value)
end
And("User clicks the Create Game button") do
  click_button('Create Game')
end
