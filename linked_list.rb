class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  def append(value)
    if @head.nil?
      prepend(value)
    else
      @temp = @head
      @temp = @temp.next_node until @temp.next_node.nil?
      @temp.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @temp = Node.new(value)
    if @head.nil?
      @head = @temp
    else
      @temp.next_node = @head.next_node
      @head.next_node = @temp
    end
  end

  def size
    @temp = @head
    nodes = 0
    until @temp.nil?
      @temp = @temp.next_node
      nodes += 1
    end
    nodes
  end
end

list = LinkedList.new
list.append(2)
list.prepend(1)
puts list.size
