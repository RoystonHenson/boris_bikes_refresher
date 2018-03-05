class Van
  attr_reader :cargo_area, :docking_station

  def initialize
    @cargo_area = []
  end

  def collect_broken_bikes(docking_station)
    @docking_station = docking_station
    @cargo_area = docking_station.bikes.select { |x|
      x.working == false
    }
    delete_bike_record
  end

  private

  def delete_bike_record
    docking_station.bikes.reject! { |x| x.working == false}
  end
end
