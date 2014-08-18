require 'docking_station'

describe Docking_Station do
	let(:station) { Docking_Station.new }
	let(:bike) { double :bike, broken?: false }
	let(:broken_bike) { double :broken_bike, broken?: true}

	let(:station_with_bikes) { Docking_Station.new([bike]) }
	let(:station_with_broken_bikes) {Docking_Station.new([broken_bike,bike])}

	it "should return an empty array of bikes by default" do
		expect(station.bikes).to eq []
	end

	it "should be able to be created containing bikes" do
		
		expect(station_with_bikes.bikes).to eq [bike]
	end

	it "should be able to accept a bike" do
		station.dock(bike)
		expect(station.bikes).to eq [bike]
	end

	it "should be able to release a bike" do
		station_with_bikes.release_bike
		expect(station_with_bikes.bikes).to eq []
	end

	it "should know what broken_bikes it has" do
		expect(station_with_broken_bikes.broken_bikes).to eq [broken_bike]
	end	

	it "should know what working bikes it has" do
		expect(station_with_broken_bikes.working_bikes).to eq [bike]
	end

	it "should be able to release broken_bikes" do
		expect(station_with_broken_bikes.release_bike).to eq [broken_bike]
	end
end