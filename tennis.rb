module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
      player1.record_won_ball! if winner == 1
      player2.record_won_ball! if winner == 2
    end
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score 
      if @points == 0
        return 'love'
      elsif @points == 1
        return 'fifteen'
      elsif @points == 2
        return 'thirty'
      elsif @points == 3
        return 'forty'
      elsif @points >= 4 && opponent.points >= 4 && (@points == opponent.points)
        return 'deuce'
      elsif @points >= 4 && @points == (opponent.points + 1)
        return 'advantage'
      elsif @points >= 4 && @points == (opponent.points + 2)
        return 'win'
      else
        return 'something else'
      end
    end
  end
end