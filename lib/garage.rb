class Garage
  attr_writer :workshop

  def initialize
    @workshop = []
  end

  def self.workshop
    @workshop
  end
end
