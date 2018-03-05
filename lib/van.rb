class Van
  attr_reader :cargo_area

  def collect_broken_bikes(docking_station)
    @broken_bikes = docking_station.bikes.select { |x|
      x.working == false
    }
    docking_station.bikes.reject! { |x| x.working == false}
    @cargo_area = @broken_bikes
  end
end
