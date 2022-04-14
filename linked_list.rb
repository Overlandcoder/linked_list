require 'pry-byebug'

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
      node = @head
      node = node.next_node until node.next_node.nil?
      node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    node = @head
    nodes = 0
    until node.nil?
      node = node.next_node
      nodes += 1
    end
    nodes
  end

  def head
    @head
  end

  def tail
    @tail = @head
    @tail = node.next_node until node.next_node.nil?
    @tail
  end

  def at(index)
    node = @head
    counter = 1
    until node.next_node.nil?
      return node if index == 0
      node = node.next_node
      return node if counter == index
      counter += 1
    end
  end

  def pop
    node = @head
    if node.next_node.nil?
      @head = @head.next_node
    else
      node = node.next_node until node.next_node.next_node.nil?
      node.next_node = node.next_node.next_node
    end
  end

  def contains?(value)
    node = @head
    until node.nil?
      return true if node.value == value
      node = node.next_node
    end
  end

  def find(value)
    node = @head
    index = 0
    until node.next_node.nil?
      return index if node.value == value
      node = node.next_node
      index += 1
    end
    return nil if !contains?(value)
    index
  end

  def to_s
    node = @head
    until node.nil?
      puts "#{node.value}"
      node = node.next_node
    end
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    if index.zero?
      Node.new(value, @head)
    else
      node = at(index)
      at(index - 1).next_node = new_node
      new_node.next_node = node
    end
  end

  def remove_at(index)
    if index.zero?
      @head = @head.next_node
    elsif at(index) == @tail
      @tail = at(index - 1)
      at(index - 1).next_node = at(index).next_node
    else
      at(index - 1).next_node = at(index).next_node
    end
  end
end

list = LinkedList.new
list.append(1)
list.append(2)
list.append(3)
list.append(4)
p list.to_s
list.insert_at(0, 1)
p list.to_s
list.remove_at(4)
p list.to_s