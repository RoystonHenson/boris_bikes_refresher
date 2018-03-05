require 'van'

describe Van do
  let(:bike)   { double('bike', working: true) }
  let(:bike_2) { double('bike', working: false) }
  let(:docking_station) { double('docking station', bikes: [bike, bike_2]) }

  describe '#collect_broken_bikes' do

  end
end
