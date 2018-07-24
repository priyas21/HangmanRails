Given("Game has been created") do
  visit new_game_path
  fill_in("Player", :with => "Priya")
  click_button('Create Game')
end

Then("Guesses made should have {string}") do |letter|
  h4 = page.find(:css, 'h4 ul')
  expect(h4).to have_css('li', text: letter)
end
