require './lib/station.rb'

class Journey

attr_reader  :current_journey, :entry_station, :exit_station

  BASE_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @current_journey = {}
  end

  def start(entry_station)
    @entry_station = entry_station
    @current_journey[:start] = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
    @current_journey[:finish] = exit_station
  end

  def complete?
    !@entry_station.nil? && !@exit_station.nil?
  end

  def fare
   complete? ? BASE_FARE : PENALTY_FARE
  end

end
