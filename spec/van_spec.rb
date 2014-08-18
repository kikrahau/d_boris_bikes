require 'docking_station'
require 'van'

describe Van do
	let(:station) {double :station}
	let(:van) {Van.new}
	it_behaves_like "BikeContainer"

	it "should be able to request broken bikes from a station" do
		expect(station).to receive(:release_broken_bikes)
		van.dock_all_broken_bikes(station)
	end

	it "after requesting broken bikes should contain broken bikes" do
		allow(station).to receive(:release_broken_bikes).and_return(:broken_bike)
		van.dock_all_broken_bikes(station)
		expect(van.bikes).to eq [:broken_bike]
	end
end