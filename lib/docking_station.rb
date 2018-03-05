require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity, :working_bike

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    find_working_bike
    raise 'There are no available bikes.' if unavailable?
    @bikes.delete(working_bike)
  end

  def dock_bike(bike)
    raise 'This bike stand is full.' if full?
    @bikes << bike
  end

  def show_bikes
    @bikes
  end

  private

  def unavailable?
     @bikes.empty? || working_bike.nil?
  end

  def full?
     @bikes.count >= capacity
  end

  def find_working_bike
    @working_bike = @bikes.find { |x| x.working == true }
  end
end
