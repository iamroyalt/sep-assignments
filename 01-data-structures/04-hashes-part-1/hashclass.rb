class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  #add entry into hash
  def []=(key, value)
    #hash_index = index(key, @items)
    #new_hash_item =
  end


  def [](key)
  end

  def resize
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    ascii = 0
    key.each_ do |x|
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
