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
    if movie_rating == nil
     return nil
   end

   if root == nil
     return nil
   end
   if rating == root.movie_rating
     root
   else
     if rating < root.movie_rating
       find(root.left, movie_rating)
     elsif rating > root.movie_rating
       find(root.right, movie_rating)
     end
   end
 end

  def delete(root, movie_rating)
    if movie_rating == nil
      return nil
    end
    if root == nil
      return root
    elsif movie_rating < root.movie_rating
      root.left = delete(root.left, movie_rating)
    elsif movie_rating > root.movie_rating
      root.right = delete(root.right, movie_rating)
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
