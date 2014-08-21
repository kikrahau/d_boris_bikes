module BikeContainer

	IS_BROKEN = ->(bike){bike.broken?}
	IS_WORKING = ->(bike){!bike.broken?}
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

	def broken_bikes
		bikes_of_type(IS_BROKEN)
	end
	
	def working_bikes
		bikes_of_type(IS_WORKING)
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

	def get_bikes_from(container, bike_type=ALL)
		# all, broken, working
		@bikes += container.bikes_of_type(bike_type)
		container.bikes = container.bikes.reject &bike_type
	end

	def get_broken_bikes_from(container)
		get_bikes_from(container, IS_BROKEN)
	end

	def get_working_bikes_from(container)
		get_bikes_from(container, IS_WORKING)
	end
end