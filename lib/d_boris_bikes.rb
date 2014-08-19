class Bike

	attr_reader :serial, :checkout_time, :checkin_time

	def initialize
		@broken = false
		@rented = false
		@serial = random_serial_generator
		@checkout_time = nil
		@checkin_time = nil
	end

	def broken?
		@broken
	end

	def random_serial_generator
		(0..9).map{rand(0..9)}.join
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

	def rent!
		@rented = true
		@checkout_time = Time.now.round(0)
	end

	def return!
		@rented = false
		@checkin_time = Time.now.round(0)
	end

	def seconds_rented
		@checkin_time - @checkout_time
	end


end