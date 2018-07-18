Given("User is on homepage") do
  visit root_path
end
When("User click on the New Custom Game button") do
  click_button('New Custom Game')
end
