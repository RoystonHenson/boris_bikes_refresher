require 'docking_station.rb'

describe DockingStation do
  let(:bike)   { Bike.new }

  describe '#initialize' do
    context 'user does not set capacity' do
      it 'has default capacity' do
        subject { DockingStation.new }
        expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
      end
    end

    context 'user sets capacity' do
      subject { DockingStation.new(40) }
      it 'has user-specified capacity' do
        expect(subject.capacity).to eq(40)
      end
    end
  end

  describe '#release_bike' do
    it { is_expected.to respond_to(:release_bike) }

    context 'when working bikes stored' do
      it 'releases a bike' do
        subject.dock_bike(bike)
        expect(subject.release_bike).to eq(bike)
      end
    end

    context 'when no bikes stored' do
      it 'throws error' do
        expect { subject.release_bike }.to raise_error('There are no available bikes.')
      end
    end

    context 'when only broken bikes stored' do
      it 'does not release' do
        bike = double('bike', working: false)
        subject.dock_bike(bike)
        subject.release_bike
        expect(subject.bikes).to eq([bike])
      end
    end
  end

  describe '#dock_bike' do
    it { is_expected.to respond_to(:dock_bike) }

    context 'when bike stand is not full'
      it 'docks a bike' do
        (DockingStation::DEFAULT_CAPACITY - 1).times do
          subject.dock_bike(Bike.new)
        end
      subject.dock_bike(bike)
      expect(subject.bikes).to include(bike)
    end

    context 'when bike stand is full' do
      it 'throws error' do
        DockingStation::DEFAULT_CAPACITY.times do
          subject.dock_bike(Bike.new)
        end
        expect { subject.dock_bike(bike) }.to raise_error('This bike stand is full.')
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
