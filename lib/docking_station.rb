require_relative 'bike'

class DockingStation
  attr_reader :bike_stand

  CAPACITY = 1

  def initialize
    @bike_stand = []
  end

  def release_bike
    release_bike_error
    @bike_stand.pop
  end

  def dock_bike(bike)
    dock_bike_error
    @bike_stand << bike
  end

  def show_bikes
    @bike_stand
  end

  private

  def release_bike_error
    raise 'There are no available bikes.' if @bike_stand.empty?
  end

  def dock_bike_error
    raise 'This bike stand is full.' if @bike_stand.length >= CAPACITY
  end
end
