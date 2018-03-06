require 'docking_station'

describe DockingStation do
  let(:bike)   { double('bike', working: true) }
  let(:van) { double('van', cargo_area: [bike]) }

  describe '#initialize' do
    context 'user does not set capacity' do
      it 'has default capacity' do
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
      it 'does not release broken bike' do
        allow(bike).to receive(:working).and_return(false)
        subject.dock_bike(bike)
        expect { subject.release_bike }.to raise_error('There are no available bikes.')
        expect(subject.bikes).to eq([bike])
      end

      it 'still raises error message when broken bikes stored' do
        allow(bike).to receive(:working).and_return(false)
        subject.dock_bike(bike)
        expect { subject.release_bike }.to raise_error('There are no available bikes.')
      end
    end
  end

  describe '#dock_bike' do
    context 'when bike stand is not full' do
      it 'docks a working bike' do
        subject.dock_bike(bike)
        expect(subject.bikes).to eq([bike])
      end

      it 'docks a broken bike' do
        allow(bike).to receive(:working).and_return(false)
        subject.dock_bike(bike)
        expect(subject.bikes).to eq([bike])
      end
    end

    context 'when bike stand is full' do
      it 'throws error' do
        DockingStation::DEFAULT_CAPACITY.times do
          subject.dock_bike(bike)
        end
        expect { subject.dock_bike(bike) }.to raise_error('This bike stand is full.')
      end
    end
  end

  describe '#show_bikes' do
    it 'shows docked bikes' do
      subject.dock_bike(bike)
      expect(subject.show_bikes).to eq([bike])
    end
  end

  describe '#gather_broken_bikes' do
    it ' gathers bikes for van pickup' do
      allow(bike).to receive(:working).and_return(false)
      subject.dock_bike(bike)
      subject.gather_broken_bikes
      expect(subject.pickup).to eq([bike])
    end
  end

  describe '#accept_delivery' do
    it 'accepts bike delivery from van' do
      subject.accept_delivery(van)
      expect(subject.bikes).to eq([bike])
    end
  end
end
