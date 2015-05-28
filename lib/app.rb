require 'codebreaker'

class App 
  
  DATA_FOLDER = 'data'
  SCOREBOARD_FILE = 'scoreboard.marsh'

  def initialize(file_name)
    @game_file = DATA_FOLDER + '/' + file_name
    @scoreboard_file = DATA_FOLDER + '/' + SCOREBOARD_FILE
    game_init
    scoreboard_init
  end

  def prev_results
    @game.gues_results
  end

  def check(gues)
    @game.check(gues)
    File.open(@game_file, 'w') {|f| f.write(Marshal.dump(@game)) }
  end

  def status
    @game.game_status
  end

  def score
    @game.score
  end

  def save_res(name)
    @score_board
  end


private
  def scoreboard_init
    if File.exist?(@scoreboard_file)
      @score_board = Marshal.load(File.read(@scoreboard_file))
    else
      @score_board = []
      File.open(@scoreboard_file, 'w') {|f| f.write(Marshal.dump(@score_board)) }
    end
  end

  def game_init
    if File.exist?(@game_file)
      @game = Marshal.load(File.read(@game_file))
    else
      @game = Codebreaker::Game.new
      @game.start
      File.open(@game_file, 'w') {|f| f.write(Marshal.dump(@game)) }
    end
  end
end