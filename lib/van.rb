class Van
  attr_reader :cargo_area

  def initialize
    @cargo_area = []
  end

  def pickup_bikes(pickup_point)
    @cargo_area = pickup_point.pickup
  end
end
