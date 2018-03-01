require 'bike'

describe Bike do
  describe '#working?' do
    it { expect(subject).to respond_to (:working?) }
  end
end
