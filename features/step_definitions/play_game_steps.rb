Given("User is on game page") do
  visit new_game_path
  fill_in("Player", :with => "Priya")
  click_button('Create Game')
end
