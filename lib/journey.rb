require './lib/station.rb'

class Journey
attr_reader  :entry_station, :exit_station, :current_journey

  def initialize
    @entry_station
    @exit_station
    @current_journey = {}
  end

  @count = 0

  def start(entry_station)
    @entry_station = entry_station
    @current_journey[:start] = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
    @current_journey[:end] = exit_station
  end

  def complete?
    @entry_station !=nil && @exit_station !=nil
  end

  def fare
    return complete? ? 1 : 6
  end

end
