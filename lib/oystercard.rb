require_relative 'journey.rb'

class Oystercard

MAXIMUM_LIMIT = 90
MINIMUM_BALANCE = 1

attr_reader :balance, :journey, :all_journeys

  def initialize
    @balance = 0
    @all_journeys = []
  end

  def top_up(amount)
    raise 'Cannot top up over £90!' if @balance + amount > MAXIMUM_LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficient balance to touch in" if @balance < MINIMUM_BALANCE
    @journey = Journey.new
    @journey.start(entry_station)
  end

  def touch_out(exit_station)
    deduct(@journey.fare)
    @journey.finish(exit_station)
    @all_journeys << @journey.current_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end
  
end
