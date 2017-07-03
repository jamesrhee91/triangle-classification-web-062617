class Triangle
  attr_accessor :side1, :side2, :side3, :all_sides

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @all_sides = [side1, side2, side3]
  end

  def kind
    if @all_sides.all? {|side| side > 0} && illegal?
      case @all_sides.uniq.size
      when 1
        :equilateral
      when 2
        :isosceles
      when 3
        :scalene
      end
    else
      raise TriangleError
    end
  end

  def illegal?
    if @side1+@side2>@side3 && @side2+@side3>@side1 && @side1+@side3>@side2
      return true
    end
    false
  end

end

class TriangleError < StandardError

end
