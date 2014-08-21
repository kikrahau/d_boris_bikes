class Bike

	attr_reader :serial, :checkout_time, :checkin_time

	def initialize
		@broken = false
		@rented = false
	end

	def broken?
		@broken
	end

	def break!
		@broken = true
	end

	def fix!
		@broken = false
	end

	def rented?
		@rented
	end

end