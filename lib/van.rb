class Van
  attr_reader :cargo_area

  def initialize
    @cargo_area = []
  end

  def collect_broken_bikes(docking_station)
    @cargo_area = docking_station.bikes.select { |x|
      x.working == false
    }
    docking_station.bikes.reject! { |x| x.working == false}
  end
end
