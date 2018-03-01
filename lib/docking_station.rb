require_relative 'bike'

class DockingStation
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'There are no available bikes.' if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    raise 'This bike stand is full.' if full?
    @bikes << bike
  end

  def show_bikes
    @bikes
  end

  private

  def empty?
     @bikes.empty?
  end

  def full?
     @bikes.count >= DEFAULT_CAPACITY
  end
end
