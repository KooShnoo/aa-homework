require 'pry'

class GraphNode
  attr_accessor :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end
end

def bfs(start_node, target_value)
  visited = Set[]
  node_q = [start_node]

  until node_q.empty?
    current_node = node_q.shift
    visited.add(current_node)
    return current_node if current_node.value == target_value

    unvisited_neighbors = current_node.neighbors.reject { |neighbor| visited.include?(neighbor) }
    node_q += unvisited_neighbors
  end
  nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

binding.pry

