require 'garage'

describe Garage do
  let(:bike) { double('bike', working: false) }
  let(:van) { double('van', cargo_area: [bike]) }

  describe '#initialize' do
    it 'initialises with empty array bikes' do
        expect(subject.bikes).to eq([])
    end
  end

  describe '#accept_delivery' do
    it 'accepts bike delivery from van' do
      subject.accept_delivery(van)
      expect(subject.bikes).to eq([bike])
    end
  end

  describe '#repair_bikes' do
    it 'changes bikes working state to true' do
      subject.bikes << bike
      allow(bike).to receive_messages(fix: bike, working: true)
      subject.repair_bikes
      expect(bike.working).to eq(true)
    end
  end

  describe '#gather_working_bikes' do
    it 'gathers bikes for van pickup' do
      bike = double('bike', working: true)
      subject.bikes << bike
      subject.gather_working_bikes
      expect(subject.pickup).to eq([bike])
    end
  end
end
