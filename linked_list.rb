# frozen_string_literal: true

require_relative 'node'

# The full Linked list?
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      tail.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def tail
    current_node = @head
    return current_node if current_node.nil?

    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def size
    count = 0
    current_node = @head
    until current_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def at(index)
    i = 0
    current_node = @head
    while i < index
      i += 1
      current_node = current_node.next_node
      return current_node if current_node.nil?
    end
    current_node
  end

  def pop
    last_node = tail
    return nil if last_node.nil?

    if last_node == @head
      @head = nil
    else
      at(size - 2).next_node = nil
    end
    last_node
  end

  def contains?(value)
    current_node = @head
    until current_node.nil?
      if current_node.value == value 
        return true
      else
        current_node = current_node.next_node
      end
    end
    false
  end

  def find(value)
    current_node = @head
    position = 0
    until current_node.nil?
      return position if current_node.value == value

      position += 1
      current_node = current_node.next_node
    end
    nil
  end

  def to_s
    current_node = @head
    until current_node.nil?
      print "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end
    p nil
  end

end


my_list = LinkedList.new
10.times { my_list.append(rand(100)) }
my_list.to_s
