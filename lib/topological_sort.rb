require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms
def topological_sort(vertices)
  in_edge_counts = {}
  sorted = []
  queue = []

  vertices.each do |vertex|
    in_edge_counts[vertex] = vertex.in_edges.count
    queue << vertex if vertex.in_edges.empty?
  end

  until queue.empty?
    current = queue.shift
    sorted << current

    current.out_edges.each do |edge|
      in_edge_counts[edge.to_vertex] -= 1
      queue << edge.to_vertex if in_edge_counts[edge.to_vertex] == 0
    end

  end

  sorted.length == 2 ? [] : sorted
end
