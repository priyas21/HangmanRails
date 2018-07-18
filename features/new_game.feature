Feature: New Game

   Feature Description
   Scenario: User Creates a new Game
   Given User is on new game page
   When User fills in "Player" with "Priya"
   And User clicks the Create Game button
   Then User should see "Welcome Priya"
