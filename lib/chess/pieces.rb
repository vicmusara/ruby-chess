# frozen_string_literal: true

class Piece
  attr_reader :color, :position, :symbol

  def initialize(color, position)
    @color = color
    @position = position
    @symbol = define_symbol
  end

  def define_symbol
    # Define piece symbol, e.g., 'P' for pawn
  end
end

class Rook < Piece
  def initialize(color, position)
    super
    @symbol = color == 'White' ? '♖' : '♜'
  end
end

class Knight < Piece
  def initialize(color, position)
    super
    @symbol = color == 'White' ? '♘' : '♞'
  end
end


