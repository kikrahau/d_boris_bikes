class Garage

	include BikeContainer

	def dock(bike)
		super
		bike.fix! if bike.broken?
	end
end