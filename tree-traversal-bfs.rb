# Tree Traversal Challenge
# Breadth-First Search Solution

class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end

  def breadth(node, value)
    enqueue(node)
    until @queue.empty?
      current_node = dequeue
      if current_node.payload == value
        return current_node
      else
        current_node.children.each {|child| enqueue(child)}
      end
    end
  end
   
end

  
# The "Leafs" of a tree, elements that have no children
fifth_node    = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, fifth_node])

queue = Queue.new
puts queue.breadth(trunk, 11)