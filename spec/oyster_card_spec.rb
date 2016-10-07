require './lib/oystercard.rb'

describe Oystercard do

  subject(:oystercard) {described_class.new}
  let(:station1){double("station", name: "Bank", zone: 1)}
  let(:station2){double("station", name: "Angel", zone: 2)}


  it 'has a balance of zero' do
    expect(oystercard.balance).to eq 0
  end

  describe "#top_up" do
    before do
      @balance = 0
    end

    it 'adds to balance' do
      expect{ oystercard.top_up(1) }.to change {oystercard.balance}.by 1
    end

    it 'raises an error' do
      expect{oystercard.top_up(91)}.to raise_error 'Cannot top up over £90!'
    end

  end

  describe '#touch_in' do

    before do
      oystercard.top_up(20)
    end

    it 'can touch in' do
      oystercard.touch_in(:station1)
    end

    it 'raise an error when touch in and the balance is lower than minimum' do
      expect{ oystercard.touch_in(:station1) }.to raise_error "Insufficient balance to touch in"
    end

    it 'remembers the entry station after the touch in' do
      oystercard.touch_in(:station1)
      expect(oystercard.touch_in(:station1)).to eq(:station1)
    end
  end

  describe '#touch_out' do
    before do
      oystercard.top_up(20)
      oystercard.touch_in(:station1)
    end

    it 'stores exit station' do
      expect(oystercard.touch_out(:station2)).to eq(oystercard.all_journeys)
    end

    it 'responds to touch out method' do
      expect(oystercard).to respond_to(:touch_out)
    end

    it 'can touch out' do
      oystercard.touch_out(:station2) #WRITE DIFFERENT TEST FOR TOUCH OUT
    end

    xit 'deducts a fare' do
      expect{oystercard.touch_out(:station2)}.to change{oystercard.balance}.by(-1)
    end

  end
end
