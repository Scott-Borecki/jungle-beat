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
      counter = 1
      node = @head

      until node.next_node.nil?
        counter += 1
        node = node.next_node
      end

      counter
    end
  end

  def find(position, quantity)
    if @head.nil?
      string = ''
    else
      counter = 0
      node = @head

      until counter == position
        counter += 1
        node = node.next_node
      end

      counter = 1
      string = node.data

      until counter == quantity || counter + position == count
        counter += 1
        string = string + ' ' + node.next_node.data
        node = node.next_node
      end
    end

    string
  end

  def includes?(data)
    node = @head
    return true if node.data == data

    until node.next_node.nil?
      return true if node.next_node.data == data
      node = node.next_node
    end

    false
  end

  def insert(position, data)
    if count == 0 || count < position
      append(data)
    else
      counter = 1
      node = @head

      until counter == position
        counter += 1
        node = node.next_node
      end

      next_node = node.next_node
      node.next_node = Node.new(data, next_node)
    end
  end

  def pop
    if @head.nil?
      popped = ''
    elsif @head.next_node.nil?
      popped = @head.data
      @head = nil
    else
      node = @head

      until node.next_node.next_node.nil?
        node = node.next_node
      end

      popped = node.next_node.data
      node.next_node = nil
    end

    popped
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
