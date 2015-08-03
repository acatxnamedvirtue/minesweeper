class Tile
  NEIGHBOR_OFFSETS = [
    [-1, -1],
    [+0, -1],
    [+1, -1],
    [-1, +0],
    [-1, +0],
    [-1, +1],
    [+0, +1],
    [+1, +1]
]

  def initialize(board, pos)
    @board = board
    @pos = pos
    @bomb = false
    @flagged = false
    @revealed = false
  end

  def reveal
    revealed = true
  end

  private
  attr_accessor :revealed
end
