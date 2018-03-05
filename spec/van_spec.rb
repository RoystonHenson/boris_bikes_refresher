require 'van'

describe Van do
  let(:bike)   { double('bike', working: true) }
  let(:bike_2) { double('bike 2', working: false) }
  let(:docking_station) { double('docking station', bikes: [bike, bike_2]) }

  describe '#initialize' do
    it 'initialises with a cargo area' do
      expect(subject.cargo_area).to eq([])
    end
  end

  describe '#collect_broken_bikes' do
    it { is_expected.to respond_to(:collect_broken_bikes) }

    it 'removes broken bikes from docking station' do
      subject.collect_broken_bikes(docking_station)
      expect(docking_station.bikes).to eq([bike])
    end

    it 'stores removed bikes in van' do
      subject.collect_broken_bikes(docking_station)
      expect(subject.cargo_area).to eq([bike_2])
    end
  end
end