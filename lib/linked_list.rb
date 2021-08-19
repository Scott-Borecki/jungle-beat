class LinkedList
  attr_reader :head

  def intitialize
    @head = nil
  end

  def append(data)
    @head = Node.new(data)
  end

  def count
    if head.nil?
      0
    elsif head.next_node.nil?
      1
    else
      2
    end
  end

  def to_string
    head.data
  end
end
