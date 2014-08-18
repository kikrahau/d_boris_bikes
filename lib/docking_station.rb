class Docking_Station
	IS_BROKEN = ->(bike){bike.broken?}

	def initialize(bikes=[])
		@bikes = bikes
	end

	def bikes
		@bikes
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
end