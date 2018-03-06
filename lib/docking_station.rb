require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity, :working_bike, :pickup

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

  def gather_broken_bikes
    @pickup = bikes.select { |x| x.working == false }
    bikes.reject! { |x| x.working == false }
  end

  def accept_delivery(van)
    van.cargo_area.reject! { |x| bikes << x }
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
