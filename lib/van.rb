class Van
  attr_reader :cargo_area, :delivery

  def initialize
    @cargo_area = []
  end

  def collect_broken_bikes(docking_station)
    @cargo_area = docking_station.bikes.select { |x|
      x.working == false
    }
    docking_station.bikes.reject! { |x| x.working == false}
  end

  def deliver_broken_bikes
    @delivery = @cargo_area
    clear_cargo_area
  end

  private

  def clear_cargo_area
      @cargo_area = []
  end
end
