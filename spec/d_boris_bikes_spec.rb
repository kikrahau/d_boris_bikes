require 'd_boris_bikes'

describe Bike do

	let(:bike) { Bike.new }

	it "should have a serial number when created" do
		expect(bike.serial).not_to be nil
	end

	it "should not be broken when it is created" do
		expect(bike.broken?).to be false
	end

	it "should be able to break" do
		bike.break!
		expect(bike).to be_broken
	end

	it "should be able to get fixed" do
		bike.break!
		bike.fix!
		expect(bike).not_to be_broken
	end
	
end