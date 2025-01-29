require './base_player.rb'

class MultiplePlayer < BasePlayer
  def initialize(game:, name:)
    super(game: game, name: name)
    @visited = {}
    @current_point = nil
  end

  def next_point(time:)
    # If this is the first move, start from the bottom-left position
    if @current_point.nil?
      @current_point = { row: 0, col: 0 }
      @visited[@current_point] = true
      return @current_point
    end

    # Get all possible neighboring points from the current position
    points = @game.grid.edges[@current_point]
    return @current_point if points.nil?

    # Filter out already visited points from the player's perspective
    unvisited_points = points.keys.reject { |point| visited?(point) }

    # If all neighbors are visited, stay at the current position
    return @current_point if unvisited_points.empty?

    # Find the unvisited neighbor with the minimal distance (or some other strategy)
    new_position = choose_best_move(unvisited_points)

    # Move to the new position and mark it as visited
    @current_point = new_position
    @visited[@current_point] = true

    # Return the new position
    return @current_point
  end

  private

  def visited?(point)
    # Check if the point has already been visited by this player
    @visited[point] || false
  end

  def choose_best_move(unvisited_points)
    unvisited_points.first
  end

  def update_position(point)
    @visited[point] = true # mark point has been visited
    @current_position = point
  end

end