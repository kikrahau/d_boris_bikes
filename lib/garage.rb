class Garage

	include BikeContainer

	def dock(bike)
		bike.fix! if bike.broken?
		super
	end
end