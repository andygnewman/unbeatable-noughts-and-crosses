require 'sinatra'
require_relative './lib/game'


class TicTacToe < Sinatra::Base

  set :root, File.dirname(__FILE__)

  game = Game.new

  get '/' do
    @board = game.board.get_board
    erb :index
  end




  # start the server if ruby file executed directly
  run! if app_file == $0

end
