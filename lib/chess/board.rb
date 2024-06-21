# frozen_string_literal: true

require_relative 'pieces'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    setup_pieces
  end

  def display
    grid.each do |row|
      puts row.map { |piece| piece.nil? ? '.' : piece.symbol }.join(' ')
    end
  end

  def move_piece(move)
    start_pos, end_pos = parse_move(move)
    piece = grid[start_pos[0]][start_pos[1]]
    grid[end_pos[0]][end_pos[1]] = piece
    grid[start_pos[0]][start_pos[1]] = nil
  end

  private

  def parse_move(move)
    # Convert move from 'e2 e4' to [[6, 4], [4, 4]]
    move.split.map do |pos|
      row = 8 - pos[1].to_i
      col = pos[0].ord - 'a'.ord
      [row, col]
    end
  end

  def setup_pieces
    # Setup the initial chessboard with pieces
    # Example: grid[0][0] = Rook.new('White', [0, 0])
  end
end
