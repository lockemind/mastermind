class Mastermind

  require_relative 'board.rb'
  require_relative 'peg.rb'

  CODE_BREAKER = 'B'
  CODE_MASTER = 'M'

  def initialize mode, key=nil
    display_rules
    if mode == CODE_MASTER && key.nil?
      @solution_key = gets.chomp.delete(' ').split(',')
    else
      @solution_key = set_key key
    end

    if set_mode mode
      @board = Board.new @solution_key
    end

    game_loop
  end

  def display_rules
    puts "Welcome to MASTERMIND"
    puts "to play you must insert the pegs as follows:"
    puts "r, w, y, g"
    puts "possible colors are:"
    possible_colors = Peg.get_all_possible_pegs
    possible_colors.each do |peg|
      puts "#{Peg.get_token_for_peg peg}: #{Peg.get_name_for_peg peg} coded with #{peg}"
    end

  end

  def set_key key
    if key.nil?
      [Peg.get_random_peg, Peg.get_random_peg, Peg.get_random_peg, Peg.get_random_peg]
    else
      key.delete(' ').split(',')
    end
  end

  def set_mode mode
    if mode.upcase == CODE_MASTER || mode.upcase == CODE_BREAKER
      @mode = mode.upcase
      true
    else
      puts 'enter a proper game mode (either B for CODE_BREAKER or M for CODE_MASTER)'
      false
    end
  end

  def game_loop
    12.times do |i|
      puts (i+1).to_s + ' of 12 - enter your code:'
      code = gets.chomp.delete(' ').split(',')
      puts "#{Peg.get_tokens_for_code code}   #{Peg.get_tokens_for_code evaluate_code code}"
      if code == @solution_key 
        break
      end
    end
    if code == @solution_key 
        puts "You Won!"
    else  
        puts "You Loose!"
    end
  end


  def evaluate_code code

    evaluation_array = []
    exclude = []
    code.each_with_index do |peg, index|

      if peg == @solution_key[index]
        evaluation_array << 'r'
      elsif @solution_key.include? peg
        evaluation_array << 'w'
      end
    end
    evaluation_array
  end

end

game = Mastermind.new 'B'