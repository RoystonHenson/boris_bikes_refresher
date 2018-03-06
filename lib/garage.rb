class Garage
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def accept_delivery(van)
    van.cargo_area.reject! { |x|
      @bikes << x
    }
  end
end
