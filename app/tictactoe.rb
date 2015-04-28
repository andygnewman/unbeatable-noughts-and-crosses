



class TicTacToe < Sinatra::Base

  set :root, File.dirname(__FILE__)

  game = Game.new



  # start the server if ruby file executed directly
  run! if app_file == $0

end
