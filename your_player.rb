require './base_player.rb'

class YourPlayer < BasePlayer
  # Implement your strategy here.
  def initialize(game:, name:)
    super(game: game, name: name)
    @current_point = nil
    @visited = {}
  end

  def next_point(time:)
    # If this is first move, start from bottom-left position
    if @current_point.nil?
      @current_point = {row: 0, col: 0}
      @visited[@current_point] = true
      return @current_point
    end
    points = @game.grid.edges[@current_point]

    return @current_point if points.nil?
    # Filter out already visited points
    unvisited_point = points.keys.reject { |point| visited?(point) }
    # if all neigboars are visited stay on current position
    return @current_point if unvisited_point.empty?
    # find the minimal distance
    new_position = unvisited_point.first
    # move to new position and mark as visited
    @current_point = new_position
    @visited[@current_point] = true

    return @current_point
  end

  def grid
    game.grid
  end

  private

  def visited?(point)
    @visited.key?(point)
  end
end