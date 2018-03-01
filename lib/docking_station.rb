require_relative 'bike'

class DockingStation
  attr_reader :bike_stand

  def initialize
    @bike_stand = []
  end

  def release_bike
    Bike.new
  end

  def dock_bike(bike)
    @bike_stand << bike
  end

  def show_bikes
    @bike_stand
  end
end
