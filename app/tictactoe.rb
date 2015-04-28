require 'sinatra'
require_relative './lib/game'


class TicTacToe < Sinatra::Base

  set :root, File.dirname(__FILE__)

  get '/' do
    erb :index
  end

  get '/ready' do
    GAME = Game.new
    redirect to('/play')
  end

  get '/play' do
    GAME.computer_turn
    redirect to('/winner') unless GAME.winner == false
    @empty_cells = GAME.empty_cells
    @board = GAME.current_board
    erb :play
  end

  post '/human_choice' do
    GAME.human_turn(params[:cell])
    redirect to('/play') unless GAME.winner != false
    redirect to('/winner')
  end

  get '/winner' do
    @winner = GAME.winner
    @board = GAME.current_board
    erb :winner
  end
  

  # start the server if ruby file executed directly
  run! if app_file == $0

end
