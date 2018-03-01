require 'docking_station.rb'

describe DockingStation do
  let(:bike)   { Bike.new }
  let(:bike_2) { Bike.new }

  describe '#release_bike' do
    it { is_expected.to respond_to(:release_bike) }

    context 'when bikes available' do
      it 'releases a bike' do
        subject.dock_bike(bike)
        expect(subject.release_bike).to eq(bike)
      end
    end

    context 'when bikes not available' do
      it 'throws error' do
        expect { subject.release_bike }.to raise_error('There are no available bikes.')
      end
    end
  end

  describe '#dock_bike' do
    it { is_expected.to respond_to(:dock_bike) }

    context 'when bike stand is not full'
      it 'docks a bike' do
      subject.dock_bike(bike)
      expect(subject.bike_stand).to eq([bike])
    end

    context 'when bike stand is full' do
      it 'throws error' do
        subject.dock_bike(bike)
        expect { subject.dock_bike(bike_2) }.to raise_error('This bike stand is full.')
      end
    end
  end

  describe '#show_bikes' do
    it { is_expected.to respond_to(:show_bikes) }

    it 'shows docked bikes' do
      subject.dock_bike(bike)
      expect(subject.show_bikes).to eq([bike])
    end
  end
end
