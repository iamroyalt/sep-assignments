require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root != nil
      if root.movie_rating > node.movie_rating
        if root.left == nil
          root.left = node
        else
          self.insert(root.left, node)
        end
      elsif root.movie_rating < node.movie_rating
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
  def find(root, movie_rating)
    if movie_rating != nil && root != nil
      if root.movie_rating == movie_rating
        return root
      elsif root.movie_rating > movie_rating
        if root.left != nil
          self.find(root.left, movie_rating)
        end
      elsif root.movie_rating < movie_rating
        if root.left != nil
          self.find(root.right, movie_rating)
        end
      end
    end
  end

  def delete(root, movie_rating)
    if root == nil
      return nil
    elsif movie_rating < root.movie_rating
      root.left = self.delete(root.left, movie_rating)
    elsif movie_rating > root.movie_rating
      root.right = self.delete(root.right, movie_rating)
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
  def printf(children=nil)
    if children = nil
      puts @root.title + ": " + @root.movie_rating.to_s
      children = [@root.left, @root.right]
      printf[children]
    else
      new_children = []
      children.each do |new_children|
      puts new_children.title + ": " + new_children.movie_rating.to_s
      unless new_children.left.nil?
        new_children << new_children.left
      end
      unless new_children.right.nil?
        new_children << new_children.right
      end
      unless new_children.empty?
        printf(new_children)
      end
    end
  end
end
end
