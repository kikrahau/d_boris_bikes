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

	it "should know if it has been rented or not" do
		expect(bike.rented?).to eq false
	end

	it "should be able to be rented by a user" do
		bike.rent!
		expect(bike.rented?).to eq true
	end

	it "should know the time it has been rented" do
		t = Time.now.round(0)
		bike.rent!
		expect(bike.checkout_time).to eq t	
	end

	it "should be able to be returned by a user" do
		bike.rent!
		bike.return!
		expect(bike.rented?).to eq false
	end

	it "should know the time it has been returned" do
		t = Time.now.round(0)
		bike.return!
		expect(bike.checkin_time).to eq t	
	end

	it "should know it has been gone for 5 seconds" do
		bike.rent!
		sleep 5
		bike.return!
		expect(bike.seconds_rented).to eq 5
	end
	it "should know it has been gone for 3 seconds" do 
		bike.rent!
		sleep 3
		bike.return!
		expect(bike.seconds_rented).to eq 3
	end
end









