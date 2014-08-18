require 'd_boris_bikes'

describe Bike do

	let(:bike) { Bike.new }

	it "should not be broken when it is created" do
		expect(bike.broken?).to be false
	end

	it "should be able to break" do
		bike.break!
		expect(bike).to be_broken
	end
	
end