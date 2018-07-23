Feature: Play Game

   It will display the current
   game status. The number of remaining lives,
   Clues and whether the game is won or lost

  Background: flow till game is in progress
  Given User is on game page


  Scenario: Valid guess
  When User enters the "Letter" with "a"
  Then Guesses made should have "a"

  Scenario: Invalid guess
  When User enters the "Letter" with "@"
  Then User gets an alert "Letter is invalid"


