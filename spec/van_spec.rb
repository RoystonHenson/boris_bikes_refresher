require 'van'

describe Van do
  let(:bike)   { double('bike') }
  let(:docking_station) { double('docking station', bikes: []) }

  describe '#initialize' do
    it 'initialises with an empty cargo area' do
      expect(subject.cargo_area).to eq([])
    end
  end

  describe '#pickup_bikes' do
    it 'load bikes into van for transport' do
      allow(docking_station).to receive(:pickup).and_return([bike])
      subject.pickup_bikes(docking_station)
      expect(subject.cargo_area).to eq([bike])
    end
  end

  describe '#deliver_bikes' do
    it 'unloads bikes at destination' do
      subject.cargo_area << bike
      subject.deliver_bikes(docking_station)
      expect(docking_station.bikes).to eq([bike])
    end
  end
end
