# require_relative 'docking_station'

class Van
  attr_reader :cargo_area, :delivery

  def initialize
    @cargo_area = []
  end

  def pickup_broken_bikes(docking_station)
    @cargo_area = docking_station.pickup
  end
end
