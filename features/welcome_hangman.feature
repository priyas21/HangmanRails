Feature: Welcome to hangman

   As a admin i want the user
   to be greeted when they visit the game.
   User would be able to create a new game and
   see all the games played

   Background: flow till home page
   Given User is on homepage

Scenario: Welcome page
Then User should see 'Welcome to Hangman'

Scenario: Create new game
When User clicks the 'New Custom Game' button
Then User should see 'New Custom Game'

Scenario: List all games
When User clicks the "Click here to show all Games" link
Then User should see 'Listing all the games'