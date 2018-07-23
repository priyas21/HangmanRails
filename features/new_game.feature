Feature: New Game

   User can create a new game after
   filling out his name

   Scenario: Creates a new Game
   Given User is on new game page
   When User fills in "Player" with "Priya"
   And User clicks the "Create Game" button
   Then User should see "Welcome Priya"

   Scenario: Back to index page
   Given User is on new game page
   When User clicks the "Back" link
   Then User should see "Listing all the games"

