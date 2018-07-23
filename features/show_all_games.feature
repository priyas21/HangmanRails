Feature: Show Games

   User will be able to see all the gamnes
   and can destroy it or create a new game

   Scenario: List all games
   Given User is on index page
   Then User should see "Listing all the games"

   Scenario: Delete the game
   Given User is on index page
   When User clicks the "Destroy" link
   Then User should see "Game was successfully deleted"

   Scenario: Show the selected game
   Given User is on index page
   When User clicks the "Show" link
   Then User should see "Guesses Made:"
