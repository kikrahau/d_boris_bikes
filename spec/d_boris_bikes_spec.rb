require 'd_boris_bikes'

describe Bike do

	let(:bike) { Bike.new }

	it "should have a serial number when created" do
		expect(bike.serial).not_to be nil
	end

	it "should have a nine-digit numerical serial number" do
		expect(bike.serial.to_s).to match(/\d{9}/)
	end

	it "should have a unique serial number" do
		bike1 = Bike.new
		expect(bike.serial.to_s).not_to eq(bike1.serial.to_s)
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