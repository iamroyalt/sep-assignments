class HashClass
##what needs to be done after a reset?
  def initialize(size)
    @items = Array.new(size)
  end

  #add entry into hash
  def []=(key, value)
    movie_index = index(key, @items.size)
    if @items[movie_index].nil?
      @items[movie_index] = HashItem.new(key, value)
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
    movie_index = index(key, @items.size)
      if @items[movie_index] == nil
        return nil
      else
        @items[movie_index].value
      end

  end

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

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
