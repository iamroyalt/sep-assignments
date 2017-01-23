require_relative 'node'

class BinarySearchTree
attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root != nil
      if root.rating > node.rating
        if root.left == nil
          root.left = node
        else
          self.insert(root.left, node)
        end
      elsif root.rating < node.rating
        if root.right == nil
          root.right = node
        else
          self.insert(root.right, node)
        end
      end
    end
  end

  # Recursive Depth First Search
  #travel down single branch in search of desired element, if not found, travel up and
  #repeat the process with unvisited nodes
  def find(root, data)
    if root.title == data
      return root
    else
      left = find(root.left, data) if root.left
      right = find(root.right, data) if root.right
      left || right
    end
  end

  def delete(root, rating)
    if root == nil
      return nil
    elsif rating < root.rating
      root.left = self.delete(root.left, rating)
    elsif rating > root.rating
      root.right = self.delete(root.right, rating)
    else
      if root.left == nil && root.right == nil
        return nil
      elsif root.right == nil
        return root.left
      elsif root.left == nil
        return root.right
      end
    end
  end


  # Recursive Breadth First Search
  #search an entire row of nodes before proceeding to the next
  def printf
    queue = [@root]
    returned_string = ""

    until queue.empty?
      temp_root = queue.shift

      unless temp_root.left == nil
        queue << temp_root.left
      end
      unless temp_root.right == nil
        queue << temp_root.right
      end

      returned_string << "#{temp_root.title}: #{temp_root.rating}\n"
    end

    puts returned_string
  end
end
