class HashClass
##what needs to be done after a reset?
  def initialize(size)
    @items = Array.new(size)
  end

  #add entry into hash
  def []=(key, value)
    movie_index = self.index(key, @items.size)
    if @items[movie_index].nil?
      @items[movie_index] = HashItem.new(key, value)
    elsif @items[movie_index].key == key
      unless @items[movie_index].value == value
        @items[movie_index].value = value
        self.resize
      end
    else
      puts {@items}
      self.resize
      movie_index = index(key, @items.size)
      @items[movie_index] = HashItem.new(key,value)
    end

  end

  def [](key)
    movie_index = index(key, @items.size)
    puts {@items}
      if @items[movie_index] == nil
        return nil
      else
        @items[movie_index].value
      end
  end

  def resize
    puts "resize"
    old_items = @items
    @items = Array.new(@items.length * 2)
    old_items.each do |movie_item|
      unless movie_item.nil?
        index = self.index(movie_item.key, @items.length)
        if @items[index].nil?
          @items[index] = movie_item
        else
          self.resize
          index = self.index(movie_item.key, @items.length)
          @items[index] = movie_item
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    ascii = 0
    key.to_s.each_byte do |x|
      ascii += x
    end
    puts ascii
    ascii % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  def to_s
    @items.inspect
  end

end
