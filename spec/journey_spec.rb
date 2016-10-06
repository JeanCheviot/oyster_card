require './lib/journey.rb'

describe Journey do
  subject(:journey) {described_class.new}
  
  it 'responds to fare' do
    expect(journey).to respond_to(:fare)
  end

  it 'calculates the fare' do
    expect(journey.fare).to eq(1) | eq(6)
  end

end
