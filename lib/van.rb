class Van
  attr_reader :cargo_area

  def initialize
    @cargo_area = []
  end

  def pickup_bikes(pickup_point)
    pickup_point.pickup.reject! { |x| cargo_area << x }
  end

  def deliver_bikes(drop_off_point)
    cargo_area.reject! { |x| drop_off_point.bikes << x }
  end
end
