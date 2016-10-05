require './lib/station.rb'


describe Station do
 subject(:station) {described_class.new("Oxford Circus", 1)}

  it "takes a name" do
    expect(station.name).to eq ("Oxford Circus")
  end
  it "takes a zone" do
    expect(station.zone).to eq(1)
  #  expect(station).to respond_with_content_type(:zone)
  end
end
