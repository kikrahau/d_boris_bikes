module BikeContainer

	BROKEN = ->(bike){bike.broken?}
	WORKING = ->(bike){!bike.broken?}
	ALL = -> (bike) { true }

	DEFAULT_CAPACITY = 20

	def initialize(options= {})
		self.capacity = options.fetch(:capacity, capacity)
		self.bikes = options.fetch(:bikes, [])
	end

	def bikes
		@bikes ||= []
	end
	def bikes_of_type(bike_type = ALL)
		bikes.select &bike_type 
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
	
	def dock(bike)
		@bikes << bike
	end

	def release_bike
		@bikes.pop
	end

	def full?
		@bikes.length == capacity
	end

	def get_bikes_from(container, bike_type=ALL)
		@bikes += container.bikes_of_type(bike_type)
		container.bikes = container.bikes.reject &bike_type
	end

	def get_broken_bikes_from(container)
		get_bikes_from(container, BROKEN)
	end

	def get_working_bikes_from(container)
		get_bikes_from(container, WORKING)
	end
end