Then("User should see {string}") do |content|
  expect(page).to have_content(content)
end