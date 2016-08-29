require_relative 'node'


class LinkedList
  attr_accessor :head
  attr_accessor :tail

def initialize
  @head = nil
  @tail = nil
end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(data)
    @head = data unless @head #@head ||= data
    @tail.next = data if @tail
    @tail = data
    @tail.next = nil  #making sure it isn't pointing anywhere
  end

  def remove_tail
    current_node = @head
    if @tail == nil
      return nil
    elsif current_node == @tail
      @tail.next = nil
      @tail = nil
    else current_node.next == @tail
      @tail = current_node
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head
    while current_node != nil
      puts current_node.data
      current_node = current_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == @head
      temp_node = @head.next
      @head.next = nil
      @head = temp_node
      return
    end

    if node == @tail
      search_creepy(@tail)
      @current_node.next = nil
      @tail = @current_node
      return
    end

    search_creepy(node)
    @current_node.next = node.next
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil && @tail == nil
        @head = node
        @tail = @head
        @tail.next = nil
      else
        current_node = @head
        @head = node
        @head.next = current_node
      end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head == nil
      return @head
    else
      current_node = @head
      @head = @head.next
      return current_node
    end
  end
end

private
def search_creepy(hand)
  @current_node = @head
  #until @current_node.nil? || @current_node == node
  until @current_node.next == hand
    @current_node = @current_node.next
  end
end
