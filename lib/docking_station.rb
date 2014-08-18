class Docking_Station
	IS_BROKEN = ->(bike){bike.broken?}
	DEFAULT_CAPACITY = 20

	def initialize(options= {})
		self.capacity = options.fetch(:capacity, capacity)
		self.bikes = options.fetch(:bikes, [])
	end

	def bikes
		@bikes ||= []
	end
	
	def bikes=(value)
		@bikes = value
	end
	
	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def broken_bikes
		@bikes.select &IS_BROKEN 
	end
	
	def working_bikes
		@bikes.reject &IS_BROKEN
	end
	
	def dock(bike)
		@bikes << bike
	end

	def release_bike
		@bikes.pop
	end

	def release_broken_bikes
		broken = broken_bikes
		broken_bikes.pop
		broken
	end

	def full?
		@bikes.length == capacity
	end
end