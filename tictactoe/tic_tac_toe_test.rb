require 'test/unit'
require './tic_tac_toe.rb'

class TicTacToeTest < Test::Unit::TestCase

  def setup
    @ttt_game = TicTacToe.new
  end

  def test_board_is_initially_empty
    assert(@ttt_game.is_blank?)
  end

  def test_computer_can_place_X_in_top_right
    @ttt_game.put_marker(1, 3, "X")
    assert_equal("X", @ttt_game.value_at(1,3))
  end

  def test_cannot_place_O_on_top_of_X
    @ttt_game.put_marker(1, 1, "X")
    @ttt_game.put_marker(1, 1, "O")
    assert_equal("X", @ttt_game.value_at(1,1))
    assert_equal("Could not place marker on top of another marker", @ttt_game.error_message)
  end

end
