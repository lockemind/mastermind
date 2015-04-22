class Peg
  require 'colorize'
  # red, green, blue, yellow, white, magenta(as pink)
  @@ID = ['r','g','b','y','w','p']

  def self.get_random_peg
    return @@ID[Random.rand(5)]
  end

  def self.get_token_for_peg peg

    case peg
    when 'r' then "●".red
    when 'g' then "●".green
    when 'b' then "●".blue
    when 'p' then "●".magenta
    when 'y' then "●".yellow
    when 'w' then "●"
    end
  end

  def self.get_name_for_peg peg

    case peg
    when 'r' then "red"
    when 'g' then "green"
    when 'b' then "blue"
    when 'p' then "pink"
    when 'y' then "yellow"
    when 'w' then "white"
    end
  end

  def self.get_all_possible_pegs
    @@ID
  end

  def self.get_tokens_for_code code
    tokens = ""
    code.each do |peg|
      tokens+= self.get_token_for_peg peg
    end
    tokens
  end
end