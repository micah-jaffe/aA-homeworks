class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      puts color
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    puts "What did Simon say?"
    seq.length.times do |ind|
      user_color = gets.chomp
      unless user_color == seq[ind]
        @game_over = true
        return
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "You passed this round!"
    sleep(1)
    puts "Get ready for the next round."
    sleep(1)
    system("clear")
    sleep(1)
  end

  def game_over_message
    puts "You lost. Simon said #{seq}"
  end

  def reset_game
    initialize
  end

end
