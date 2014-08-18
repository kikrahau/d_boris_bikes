class Bike

	attr_reader :serial

	def initialize
		@broken = false
		@serial = 123456789
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
end