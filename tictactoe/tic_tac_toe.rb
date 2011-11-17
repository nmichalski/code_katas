require 'matrix'

#Monkey patch since Matrix is immutable after creation
class Matrix
  def []=(i,j, value)
    @rows.fetch(i){return nil}[j] = value
  end
end

class TicTacToe
  attr :board
  attr_reader :error_message

  def initialize
    @board = Matrix[
               ["", "", ""],
               ["", "", ""],
               ["", "", ""]
             ]
  end

  def is_blank?
    @board.each do |cell|
      return false if cell != ""
    end
    return true
  end

  def put_marker(i, j, marker)
    if @board[i-1, j-1] == ""
      @board[i-1, j-1] = marker
    else
      @error_message = "Could not place marker on top of another marker"
    end
  end

  def value_at(i, j)
    @board[i-1, j-1]
  end

end

