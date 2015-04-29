Feature: An unbeatable Tic Tic Toe
  In order to frustrate a player of the game
  As a person demonstrating my coding skills
  I want to have a game of Tic Tac Toe that a human cannot beat

  Scenario: Starting the game
  Given I am on the homepage
  Then I should see "Welcome to Tic Tac Toe"
  And I should see "Play - Human Starts" and "Play - Computer Starts"

  Scenario: Starting the game - Computer first
  Given I am on the homepage
  And I click "Play - Computer Starts"
  Then I should see a grid with 9 cells
  And I should see an "X" in cell "5"

  Scenario: Starting the game - Human first
  Given I am on the homepage
  And I click "Play - Human Starts"
  Then I should see a grid with 9 cells
  And I should see the numbers 1 to 9 in the cells

  Scenario: Submitting a human choice
  Given I have started the game
  And I select cell "1"
  Then I should see an "O" in cell "1"

  Scenario: Computer winning the game
  Given I have started the game
  And moves that let the computer win have been taken
  Then I should see "Computer Wins"

  Scenario: Drawing the game
  Given I have started the game
  And moves that will result in a draw have been taken
  Then I should see "Stalemate - a draw"
