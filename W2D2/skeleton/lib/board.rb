class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.map.with_index do |cup, i|
      cup.concat([:stone] * 4) unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    unless (0...13).include?(start_pos)
      raise ArgumentError.new("Invalid starting cup")
    end

    if @cups[start_pos].empty?
      raise ArgumentError.new("Starting cup is empty")
    end

    true
  end

  def make_move(start_pos, current_player_name)
    stones = empty_cup(start_pos)

    pos = start_pos
    until stones == 0
      pos = (pos + 1) % @cups.length
      unless opponents_point?(pos, current_player_name)
        @cups[pos] << :stone
        stones -= 1
      end
    end

    render
    next_turn(pos, current_player_name)
  end

  def empty_cup(pos)
    stones = @cups[pos].count
    @cups[pos] = []
    stones
  end

  def opponents_point?(pos, player_name)
    return true if player_name == @name1 && pos == 13
    return true if player_name == @name2 && pos == 6
    false
  end

  def next_turn(ending_cup_idx, player_name)
    if ending_cup_idx == 6 && player_name == @name1
      :prompt
    elsif ending_cup_idx == 13 && player_name == @name2
      :prompt
    elsif @cups[ending_cup_idx].count > 1
      ending_cup_idx
    else
      :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..6].all?(&:empty?) || @cups[7..13].all?(&:empty?)
  end

  def winner
    case @cups[6] <=> @cups[13]
    when 1
      @name1
    when 0
      :draw
    when -1
      @name2
    end
  end
end
