# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'pieces'

class Game
  attr_reader :board, :current_player, :players

  def initialize
    @board = Board.new
    @players = [Player.new('White'), Player.new('Black')]
    @current_player = @players[0]
  end

  def play
    loop do
      board.display
      make_move
      break if checkmate? || draw?
      switch_players
    end
    board.display
    puts "Checkmate! #{current_player.name} wins!" if checkmate?
    puts "Draw!" if draw?
  end

  private

  def make_move
    loop do
      puts "#{current_player.name}'s turn. Enter move (e.g., e2 e4):"
      move = gets.chomp
      if valid_move?(move)
        board.move_piece(move)
        break
      else
        puts "Invalid move. Try again."
      end
    end
  end

  def valid_move?(move)
    # Add validation logic
    true
  end

  def checkmate?
    # Add checkmate logic
    false
  end

  def draw?
    # Add draw logic
    false
  end

  def switch_players
    @current_player = @players.rotate!.first
  end
end
