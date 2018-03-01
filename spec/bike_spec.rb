require 'bike'

describe Bike do

  describe '#working?' do
    it { expect(subject).to respond_to (:working?) }

    context 'given the bike is working' do
      it 'returns true' do
        expect(subject.working?).to eq(true)
      end
    end
  end
end
