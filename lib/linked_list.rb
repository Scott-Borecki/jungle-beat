class LinkedList
  attr_reader :head

  def intitialize
    @head = nil
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
    else
      @head.add_next_node(data)
    end
  end

  def count
    if @head.nil?
      0
    else
      count = 1
      node = @head

      until node.next_node.nil?
        count += 1
        node = node.next_node
      end

      count
    end
  end

  def insert(position, data)
    if count == 0 || count < position
      append(data)
    else
      count = 1
      node = @head

      until count == position
        count += 1
        node = node.next_node
      end

      next_node = node.next_node
      node.next_node = Node.new(data, next_node)
    end
  end

  def prepend(data)
    if @head.nil?
      append(data)
    else
      next_node = @head
      @head = Node.new(data, next_node)
    end
  end

  def to_string
    string = ''
    unless @head.nil?
      string = @head.data.to_s
      node = @head

      until node.next_node.nil?
        string = string + ' ' + node.next_node.data.to_s
        node = node.next_node
      end
    end
    string
  end
end
