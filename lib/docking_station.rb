require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
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
     @bikes.count >= capacity
  end
end
