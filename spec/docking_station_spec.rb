require 'docking_station.rb'

describe DockingStation do
  describe '#release_bike' do
      it { is_expected.to respond_to (:release_bike) }

      it 'releases an instance of bike' do
        expect(subject.release_bike).to be_a(Bike)
      end
  end
end
