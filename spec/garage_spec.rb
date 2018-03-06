require 'garage'

describe Garage do
  describe '#initialize' do
    it 'initialises with empty array for broken bikes' do
        expect(subject.broken_bikes).to eq([])
    end
  end
end
