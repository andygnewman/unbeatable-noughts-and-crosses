Feature: An unbeatable Tic Tic Toe
  In order to frustrate a player of the game
  As a person demonstrating my coding skills
  I want to have a game of Tic Tac Toe that a human cannot beat

  Scenario: Starting the game
  Given I am on the homepage
  Then I should see "Welcome to Tic Tac Toe"
  And I should see "Start the game"
  And there should be a table with 9 numbered cells

  Scenario: Starting the game
  Given I am on the homepage
  And I click "Start the game"
  Then I should see an "X" in cell "5"
