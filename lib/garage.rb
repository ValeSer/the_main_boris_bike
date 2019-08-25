class Garage
  attr_reader :bikes
  DEFAULT_CAPACITY = 200

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    raise 'Sorry, garage is full' if full?
    @bikes << bike
  end

  def release_bike
    raise 'Sorry, garage is empty' if empty?
    available_bikes = working_bikes
    raise 'Sorry, no bikes available' if available_bikes.empty?
    @bikes.delete(available_bikes[0])
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  def working_bikes
    @bikes.select(&:working?)
  end
end
