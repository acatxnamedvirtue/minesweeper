require 'byebug'
require_relative 'tile'

class Board
  def initialize(width = 9, height = 9, num_bombs = 10)
    @grid = Array.new(width) { Array.new(height) }
    @num_bombs = num_bombs
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, tile)
    x, y = pos
    grid[x][y] = tile
  end

  def populate
    rows.each_with_index do |row, row_idx|
      row.each_with_index do |_, col_idx|
        pos = [row_idx, col_idx]
        self[pos] = Tile.new(self, pos)
      end
    end
  end

  def add_bombs
    num_bombs.times do
      pos = empty_tiles.sample.pos
      self[pos].bomb = true
    end
  end

  def empty_tiles
    grid.flatten.reject(&:bomb?)
  end

  def flag_tile(pos)
    self[pos].flagged = (self[pos].flagged? ? false : true)
  end

  def rows
    grid
  end

  def cols
    grid.transpose
  end

  def in_range?(pos)
    row_idx, col_idx = pos

    row_idx.between?(0, rows.length - 1) &&
      col_idx.between?(0, cols.length - 1)
  end

  private
  attr_reader :grid, :num_bombs
end
