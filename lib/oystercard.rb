require_relative 'journey.rb'

class Oystercard
MAXIMUM_LIMIT = 90
MINIMUM_BALANCE = 1
attr_reader :balance, :limit, :minimum, :journey, :all_journeys

  def initialize(limit=MAXIMUM_LIMIT, minimum=MINIMUM_BALANCE)
    @limit = limit
    @minimum = minimum
    @balance = 0
    @in_journey = false
    @all_journeys = []
  end

  def top_up(amount)
    raise 'Cannot top up over £90!' if @balance + amount >= @limit
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficient balance to touch in" if @balance < @minimum
    @in_journey = true
    @journey = Journey.new
    @journey.start(entry_station)
  end

  def touch_out(exit_station)
    deduct(@minimum)
    @in_journey = false
    @journey.finish(exit_station)
    @all_journeys << @journey.current_journey
  end

  def in_journey?
    @in_journey == true
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
