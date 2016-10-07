require './lib/journey.rb'

describe Journey do
  subject(:journey) {described_class.new}
  let(:station1){double("station", name: "Bank", zone: 1)}
  let(:station2){double("station", name: "Angel", zone: 2)}

  describe "Fare" do

    it 'responds to fare' do
      expect(journey).to respond_to(:fare)
    end

    it 'calculates the base fare' do
      journey.start(station1)
      journey.finish(station2)
      expect(journey.fare).to eq Journey::BASE_FARE
    end

    it 'adds penalty fare to incomplete journey without touch out' do
      journey.start(station1)
      journey.start(station2)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it 'adds penalty fare to incomplete journey without touch in' do
      journey.finish(station2)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

  end

  describe "Journey hash" do

    it 'stores start station' do
      journey.start(station1)
      expect(journey.current_journey).to include {station1}
    end

    it 'stores finish station' do
      journey.finish(station1)
      expect(journey.current_journey).to include {station1}
    end
  end


end
