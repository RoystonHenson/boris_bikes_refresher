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
    it 'accepts broken bike delivery from van' do
      subject.accept_delivery(van)
      expect(subject.bikes).to eq([bike])
    end
  end
end
