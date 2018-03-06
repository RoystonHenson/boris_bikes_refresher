class Garage
  attr_reader :bikes, :pickup

  def initialize
    @bikes = []
  end

  def accept_delivery(van)
    van.cargo_area.reject! { |x| bikes << x }
  end

  def repair_bikes
    @bikes.each { |x| x.fix }
  end

  def gather_working_bikes
    @pickup = bikes.select { |x| x.working == true }
    bikes.reject! { |x| x.working == true }
  end
end
