require 'person'

describe Person do
	let(:person) { Person.new }
	let(:person_with_bike) { Person.new(:bike) }
	let(:station) {double :station}

	it "should not have a bike by default" do
		expect(person).not_to have_bike
	end

	it "should be able to have a bike" do
		expect(person_with_bike).to have_bike
	end

	it "should be able to ask the station to release a bike" do
		expect(station).to receive(:release_bike)
		person.rent_bike_from(station)
		# expect(person.rent_bike_from(station)).to eq(bike)
	end

	it "should have a bike when the station releases a bike" do
		station = double :station, release_bike: :bike
		person.rent_bike_from(station)
		expect(person).to have_bike
	end

	it "should be able to ask the station to receive a bike" do
		station = double :station, dock: nil
		expect(station).to receive(:dock).with(:bike)
		expect(person_with_bike.return_bike_to(station)).to eq nil
	end

	it "should not have a bike after returning it" do
		station = double :station, dock: nil
		allow(station).to receive(:dock).with(:bike)
		person_with_bike.return_bike_to(station)
		expect(person_with_bike.has_bike?).to eq false
	end

	it "should be able to break a bike" do
		bike = double :bike
		person_with_bike = Person.new(bike)
		expect(bike).to receive(:break!)
		person_with_bike.has_accident
	end
end