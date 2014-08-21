require 'bike_container'

shared_examples "BikeContainer" do 

	let(:empty_container) { described_class.new }
	let(:bike) { double :bike, broken?: false }
	let(:broken_bike) { double :broken_bike, broken?: true}

	let(:container_with_bikes) { described_class.new(bikes: [bike]) }
	let(:container_with_broken_bikes) {described_class.new(bikes: [broken_bike,bike])}

	it "should return an empty array of bikes by default" do
		expect(empty_container.bikes).to eq []
	end

	it "should be able to be created containing bikes" do
		
		expect(container_with_bikes.bikes).to eq [bike]
	end

	it "should be able to accept a bike" do
		empty_container.dock(bike)
		expect(empty_container.bikes).to eq [bike]
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
		expect(empty_container.capacity.class).to eq Fixnum
	end

	it "should know if it is full" do
		empty_container.capacity.times {empty_container.dock(bike)}
		expect(empty_container).to be_full
	end
	it "should be able to get bikes from a bike_container" do 
		empty_container.get_bikes_from(container_with_broken_bikes)
		expect(empty_container.bikes).to match_array([bike,broken_bike])
	end
	it "should not have bikes that been collected" do 
		empty_container.get_bikes_from(container_with_broken_bikes)
		expect(container_with_broken_bikes.bikes).to be_empty
	end
	it "should be able to get broken bikes from a bike_container" do
		empty_container.get_broken_bikes_from(container_with_broken_bikes)
		expect(empty_container.bikes).to match_array([broken_bike])
	end
	it "should not have bikes that been collected" do 
		empty_container.get_broken_bikes_from(container_with_broken_bikes)
		expect(container_with_broken_bikes.bikes).to match_array([bike])
	end	 
	it "should be able to get working bikes from a bike_container" do
		empty_container.get_working_bikes_from(container_with_broken_bikes)
		expect(empty_container.bikes).to match_array([bike])
	end
	it "should not have bikes that been collected" do 
		empty_container.get_working_bikes_from(container_with_broken_bikes)
		expect(container_with_broken_bikes.bikes).to match_array([broken_bike])
	end	 


end