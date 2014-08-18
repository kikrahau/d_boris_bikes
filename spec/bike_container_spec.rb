require 'bike_container'

shared_examples "BikeContainer" do 

	let(:container) { described_class.new }
	let(:bike) { double :bike, broken?: false }
	let(:broken_bike) { double :broken_bike, broken?: true}

	let(:container_with_bikes) { described_class.new(bikes: [bike]) }
	let(:container_with_broken_bikes) {described_class.new(bikes: [broken_bike,bike])}

	it "should return an empty array of bikes by default" do
		expect(container.bikes).to eq []
	end

	it "should be able to be created containing bikes" do
		
		expect(container_with_bikes.bikes).to eq [bike]
	end

	it "should be able to accept a bike" do
		container.dock(bike)
		expect(container.bikes).to eq [bike]
	end

	it "should be able to release a bike" do
		container_with_bikes.release_bike
		expect(container_with_bikes.bikes).to eq []
	end

	it "should know what broken_bikes it has" do
		expect(container_with_broken_bikes.broken_bikes).to eq [broken_bike]
	end	

	it "should know what working bikes it has" do
		expect(container_with_broken_bikes.working_bikes).to eq [bike]
	end

	it "should be able to release broken_bikes" do
		expect(container_with_broken_bikes.release_broken_bikes).to eq [broken_bike]
	end

	it "should have a capacity" do
		expect(container.capacity.class).to eq Fixnum
	end

	it "should know if it is full" do
		container.capacity.times {container.dock(bike)}
		expect(container).to be_full
	end
end