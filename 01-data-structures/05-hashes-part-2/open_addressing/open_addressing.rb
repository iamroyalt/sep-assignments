require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    movie_index = self.index(key, @items.size)
    if @items[movie_index].nil?
      @items[movie_index] = Node.new(key, value)
    elsif @items[movie_index].key == key
      unless @items[movie_index].value == value
        @items[movie_index].value = value
        self.resize
      end
    else
      self.resize
      #self[key] = value
    end
  end

  def [](key)
    movie_index = self.index(key, @items.length)
    next_movie_index = @items[movie_index].next
    if next_movie_index == nil
      @items[movie_index].value
    else
      @items[next_movie_index].value
    end

  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    ascii = 0
    key.each_byte do |x|
      ascii += x
    end
    puts ascii
    ascii % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    movie_index = index + 1
    while movie_index < @items.length
      if @items[movie_index].nil?
        return movie_index
      end
      movie_index += 1
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize

  end

end
