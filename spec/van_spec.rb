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

  describe '#load_broken_bikes' do
    it 'load broken bikes into van' do
      subject.load_broken_bikes(docking_station)
      expect(docking_station.bikes).to eq([bike])
    end

    it 'stores removed bikes in van' do
      subject.load_broken_bikes(docking_station)
      expect(subject.cargo_area).to eq([bike_2])
    end
  end

  describe '#deliver_broken_bikes' do
    it 'returns the delivered bikes' do
      subject.load_broken_bikes(docking_station)
      subject.deliver_broken_bikes
      expect(subject.delivery).to eq([bike_2])
    end

    it 'clears the van cargo area' do
      subject.load_broken_bikes(docking_station)
      subject.deliver_broken_bikes
      expect(subject.cargo_area).to eq([])
    end
  end
end
