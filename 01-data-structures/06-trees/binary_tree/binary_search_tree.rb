require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root == nil
      root = node
    elsif node.rating < root.rating && root.left == nil
      root.left = nil
    elsif node.rating > root.rating && root.right == nil
      root.right = nil
    elsif node.rating < root.rating
      insert(root.left, node)
    elsif node.rating > root.rating
      insert(root.right, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
  end

  def delete(root, data)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end
end
