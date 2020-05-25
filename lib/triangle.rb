# frozen_string_literal: true

require 'pry'
class Triangle
  attr_reader
  # write code here
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def legal_triangle?
    @side1.positive? && @side2.positive? && @side3.positive? &&
      (@side1 + @side2) > @side3 && (@side2 + @side3) > @side1 &&
      (@side3 + @side1) > @side2
  end

  def kind
    if !legal_triangle?
      # binding.pry
      begin
        raise TriangleError
      end
    else
      if @side1 == @side2 && @side2 == @side3
        :equilateral
      elsif @side1 == @side2 || @side1 == @side3 || @side2 == @side3
        :isosceles
      else
        :scalene
      end
    end
  end

  class TriangleError < StandardError
    def message
      'Not a valid triangle'
    end
  end
end
