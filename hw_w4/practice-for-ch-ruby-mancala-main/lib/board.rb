require 'byebug'

class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @cups = Array.new(14) { |i| i == 6 || i == 13 ? [] : [:stone] * 4 }
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos.between?(0, 13)
    raise 'Starting cup is empty' if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    player_store_pos = current_player_name == name1 ? 6 : 13fweoifhaweifaoiwejiowejfwioejfiowejfiowjefiawjefiwjeoijweoiafjwioejfawoiefj
    hand_pos = start_pos
    loop do
      hand = cups[hand_pos]
      cups[hand_pos] = []
      # hand_pos = next_cup(start_pos)
      until hand.empty?
        hand_pos = next_cup(hand_pos)
        cups[hand_pos].push(hand.pop) unless hand_pos == player_store_pos
        # p hand_pos
      end
      # p ':)'
      # p cups[hand_pos]
      # p cups[hand_pos].empty?
      next_turn_result = next_turn(hand_pos)
      # p next_turn_result
      # p ':('
      return next_turn_result unless next_turn_result.nil?
    end
  end

  def next_cup(pos)
    return 0 if pos == 13

    pos + 1
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    # p cups[ending_cup_idx]
    # p ':9'
    if cups[ending_cup_idx].empty?
      # debugger
      return :switch
    elsif [6, 13].include?(ending_cup_idx)
      return :prompt
    end
    # debugger

    nil
  end

  def render
    print "      #{@cups[7..12].reverse.map(&:count)}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map(&:count)}      \n"
    puts ''
    puts ''
  end

  def one_side_empty?
    cups[0..5].all?(&:empty?) ^ cups[7..12].all?(&:empty?)
  end

  def winner
  end
end
