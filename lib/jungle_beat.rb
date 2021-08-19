class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(nodes_data)
    nodes = nodes_data.split(' ')

    nodes.each do |node|
      @list.append(node)
    end

    nodes_data
  end

  def count
    @list.count
  end

  def play
    beats = @list.to_string
    `say -r 500 #{beats}`
  end
end
