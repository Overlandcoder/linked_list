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

  def head
    @head.value
  end

  def tail
    @temp = @head
    @temp = @temp.next_node until @temp.next_node.nil?
    @temp.value
  end

  def at(index)
    @temp = @head
    counter = 1
    until @temp.nil?
      return @temp.value if index == 0
      @temp = @temp.next_node
      return @temp.value if counter == index
      counter += 1
    end
  end
end

list = LinkedList.new
list.append(1)
list.append(2)
list.append(3)
puts list.at(1)
puts list.at(2)

