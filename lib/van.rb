class Van
	
	include BikeContainer

	def request_broken_bikes_from station
		station.release_broken_bikes
	end

end