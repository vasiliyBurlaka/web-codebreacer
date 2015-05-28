require 'codebreaker'

class App 
  
  DATA_FOLDER = 'data'
  attr_reader :game
  attr_reader :history

  def initialize(file_name)
    game_file = DATA_FOLDER + '/' + file_name
    hist_file = game_file + '.hist'
    game_init(game_file, hist_file)

  end

  def game_init(game_file, hist_file)
    if File.exist?(game_file)
      @game = load(game_file)

      if File.exist?(hist_file)
        @history = load(hist_file)
      else
        hist_init(hist_file)
      end
    else
      @game = Codebreaker::Game.new
      @game.start
      save(@game, game_file)

      hist_init(hist_file)
    end
  end

  def hist_init(hist_file)
    @history = {}
    save(@history, hist_file)
  end

  def load(file_name)
    Marshal.load(File.read(file_name))
  end

  def save(obj, file_name)
    File.open(file_name, 'w') {|f| 
      f.write(Marshal.dump(obj))
    }
  end
end

#=begin
aplication = App.new('test.marshal1')
puts aplication.game.round_number
puts aplication.game.check(1234).to_s
puts aplication.game.check(5612).to_s
puts aplication.game.check(3456).to_s
puts aplication.game.check(3663).to_s

puts aplication.game.score
puts aplication.game.round_number
#=end
