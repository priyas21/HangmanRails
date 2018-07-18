Feature: Welcome to hangman

   As a admin i want the user
   to be greeted when they visit the game

   Background: flow till home page
   Given User is on homepage

Scenario: Welcome page
Then User should see 'Welcome to hangman'

Scenario: Create new game
When User click on the New Custom Game button
Then User should see 'New Custom Game'

Scenario: List all games
When User click on show all Games link
Then User should see 'Listing all the games'