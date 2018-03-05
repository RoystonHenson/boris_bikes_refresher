class Van

  def collect_broken_bikes(docking_station)
    @broken_bikes = docking_station.bikes.select { |x|
      x.working == false
    }
    docking_station.bikes.reject! { |x| x.working == false}
  end
end
