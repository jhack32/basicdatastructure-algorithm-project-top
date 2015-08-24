#Project 1:Searching Binary Trees
class Node
  attr_accessor :left, :right, :value
  def initialize(value, left=nil, right=nil)
    @value = value
    @left = left
    @right = right
  end
end #End of class Node

class Tree
  attr_accessor :root
  def initialize(root)
    @root = Node.new(root)
  end

  def build_tree(array)
    binary_tree_arr = Array.new
#sorting the array before it goes into the binary tree
    array.sort!
#array goes into the create_node method and pushed into new array(binary_tree_arr)
    array.each { |x| binary_tree_arr << create_nodes(@root, x) }
    binary_tree_arr
  end

#Method will create the node
    def create_nodes(node, value)
#If no node, it will create node.
      if node.nil?
        node = Node.new(value)
      else
#If the value is LESS than the node(parent) AND left side is empty, it will create it
#else, it'll go back to create_node with the node-left and value
        if value < node.value
          if node.left == nil
            node.left = Node.new(value)
          else
            create_nodes(node.left, value)
          end
#if the leftvalue is LESS than the value AND node-right is empty, create it.
#else return it back to create_node.
        elsif node.value < value
          if node.right == nil
            node.right = Node.new(value)
          else
            create_nodes(node.right, value)
          end
        else
          node
      end
    end
  end

#queues. shift/unshift
  def breadth_first_search(n)
    queue = Array.new
    queue.unshift(@root)
#While queue is greater than 0. contains something in it
      while !queue.nil?
#store the shifted queue(removed first item) to number
        number = queue.shift
        return number if number.value == n
#if queue RIGHT is NOT nil, then push to right
        queue << number.right unless number.right.nil?
#if queue LEFT is NOT nil, then push to left
        queue << number.left unless number.left.nil?
      end
    end

#stack. pop, push
    def depth_first_search(target_value)
      stack = Array.new
      stack << @root
      while stack.empty? == false
         number = stack.pop
        return number if number.value == target_value
        stack << number.left unless number.left.nil?
        stack << number.right unless number.right.nil?
      end
    end

#Depth first search recursive.
  def dfs_rec(value, node = @root)
    return node if value == node.value
    unless node.left.nil?
      left = dfs_rec(value, node.left)
      left unless left.nil?
    end
    unless node.right.nil?
      right = dfs_rec(value, node.right)
      right unless right.nil?
    end
  end

end #End of BuildTree class

array_sorted = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
root = array_sorted[0]
btree = Tree.new(root)
btree_array = btree.build_tree(array_sorted)
#p btree_array

p btree.breadth_first_search(9)
p btree.depth_first_search(4)
p btree.dfs_rec(67)
