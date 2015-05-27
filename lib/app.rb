require 'codebreaker'

class App 
  
  DATA_PATH = 'data/'
	attr_reader :game

  def initialize(game_file)
 #   @game_file = DATA_PATH + game_file
    @game = game_init(DATA_PATH + game_file)
	end

  def game_init(file_name)
    puts file_name
    if File.exist?(file_name)
      game = load(file_name)
    else
      game = Codebreaker::Game.new
      game.start
      save(file_name)
    end
    game
  end

  def load(file_name)
    Marshal.load(File.read(file_name))
  end

  def save(file_name)
    File.open(file_name, 'w') {|f| 
      f.write(Marshal.dump(@game)) 
    }
  end
end

aplication = App.new('test.marshal1')
puts aplication.game.round_number
puts aplication.game.check(4511).to_s
puts aplication.game.check(4511).to_s
puts aplication.game.check(4511).to_s
puts aplication.game.score
puts aplication.game.round_number
aplication.save('data/test.marshal1')