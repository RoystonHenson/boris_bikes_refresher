require 'bike'

describe Bike do
  describe '#initialize' do
    it 'is working when initialised' do
      expect(subject.working).to eq(true)
    end
  end

  describe '#working?' do
    it { expect(subject).to respond_to (:working?) }

    context 'given the bike is working' do
      it 'returns true' do
        expect(subject.working?).to eq(true)
      end
    end
    context 'given the bike is not working' do
      it 'returns false' do
        subject.broken
        expect(subject.working?).to eq(false)
      end
    end
  end

  describe '#broken' do
    it 'sets bike working from true to false' do
      subject.broken
      expect(subject.working).to eq(false)
    end
  end
end
