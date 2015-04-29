#Unbeatable Tic Tac Toe / Noughts and Crosses

This game provides an unbeatable noughts and crosses / tic-tac-toe game, that invites a human player to try and beat the computer (but you won't!).

![Tic Tac Toe Screenshot](https://github.com/andygnewman/unbeatable-noughts-and-crosses/blob/master/Tic-Tac-Toe-Screen-Shot.png "Tic Tac Toe Screenshot")

##Playing the game

You can play online on a [Heroku hosted version](https://andytictactoe.herokuapp.com/ "Andy's Tic-Tac-Toe")

or to play offline

- Clone this repository
- navigate to the unbeatable-noughts-and-crosses directory
- in the command line `$ rackup`
- in your browser, navigate to http://localhost:9292/

##Technologies
Built in Ruby utilising the Sinatra framework to create the server and Embedded Ruby (erb) to assist in the front end alongside HTML and CSS.

##Testing
This features both feature tests and unit tests.
- Feature tests use Cucumber / Capybara with Rspec matchers.
  - To run from the command line `$ cucumber`
- Unit tests use Rspec.
  - To run from the command line `$ rspec`

##Game Logic
The principles behind controlling the computers moves are based on the following key principles;
- if going first;
  - choose the centre square
  - then respond to the human's first move with specific dependent responses
  - from then on the computer's turn is driven by the following priorities in turn;
    - take any opportunity to complete a row of three
    - block any row where the human already has occpied two positions
    - otherwise pick the first available square
- if going second;
  - choose the centre, if the human did not choose it, otherwise choose the top left corner
  - from here on use the same logic as described in the final step above
 
