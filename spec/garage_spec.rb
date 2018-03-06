require 'garage'

describe Garage do
  describe '#initialize' do
    it 'initialises with empty array bikes' do
        expect(subject.bikes).to eq([])
    end
  end

  
end
