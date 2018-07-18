When("User enters the {string} with {string}") do |field, value|
  fill_in(field, :with => value)
  click_button('Submit')
end

When("User clicks the {string} link") do |link|
  click_link(link)
end

Then("User should see {string}") do |content|
  expect(page).to have_content(content)
end

Then("User gets an alert {string}") do |content|
  expect(page).to have_content(content)
end