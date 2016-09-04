class HashClass

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
        self.resize
      end
    else
      self.resize
      self[key] = value
    end

  end

  def [](key)
    movie_index = index(key, @items.size)
      if @items[movie_index] == nil
        return "error"
      else
        @items[movie_index].value
      end

  end

  def resize
    #create a new array
    double_array = Array.new(@items.size)
    #create an arrayto hold items
    expanded_array = []
    @items.each do |movie|
      unless @item == nil
        expanded_array << movie
      end
    end
    #wipe out the "too small"array
    #map! mutates the original array
    @items.map! do |array_item|
      unless array_item == nil
        array_item = nil
      end
    end
    #found concat after trying toString, join
    @items.concat(double_array)
      expanded_array.each do |movie|
      self[item.key] = item.value
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
