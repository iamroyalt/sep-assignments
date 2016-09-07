require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    movie_index = index(key, @items.size)
    if @items[movie_index].nil?
      @items[movie_index] = Node.new(key, value)
    elsif @items[movie_index].key == key
      unless @items[movie_index].value == value
        @items[movie_index].value = value
      end
    else
      self.resize
      self[key] = value
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
    new_movie_index = @items
    @items = Array.new(@items.length * 2)

    new_movie_index.each do |movie_item|
      unless movie_item.nil?
        index = self.index(movie_item.key, @items.length)
        if @items[index].nil?
          @items[index] = movie_item
        else
          self.resize
          self[movie_item.key] = movie_item.value
        end
      end
    end
  end

end
