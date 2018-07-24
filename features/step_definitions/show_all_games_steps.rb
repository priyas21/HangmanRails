Given("Game exists") do
  Game.create!(:name => 'Lilly', :word => 'Umberella', :initial_number_of_lives => 5)
end

Given("User is on index page") do
  visit games_path
end
