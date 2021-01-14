# frozen_string_literal: true

# Handles node behavior
class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end

  def to_s
    @value.to_s
  end
end
