	require 'codebreaker'

	file_name = 'test.marshal';	
	if (File.exist?(file_name))
	  game = Marshal.load(File.read(file_name))
	  a = '123'
	else
	  a = '333'
	  game = Codebreaker::Game.new
	  game.start
      File.open(file_name, 'w') {|f| f.write(Marshal.dump(game)) }
	end

	game.check(6522).to_s