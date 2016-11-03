class Node
  attr_accessor :title
  attr_accessor :movie_rating
  attr_accessor :left
  attr_accessor :right

  def initialize(title, movie_rating)
    @title = title
    @movie_rating = movie_rating
  end
end
