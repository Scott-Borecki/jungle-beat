class Node
  attr_accessor :data, :next_node

  def initialize(data)
    @data      = data
    @next_node = nil
  end

  def add_next_node(data)
    node = self

    until node.next_node.nil?
      node = node.next_node
    end

    node.next_node = Node.new(data)
  end
end
