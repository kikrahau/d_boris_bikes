require 'docking_station'
require 'van'

describe Van do
	let(:station) {double :station}
	let(:van) {Van.new}
	it_behaves_like "BikeContainer"

	it "should be able to request broken bikes from a station" do
		expect(station).to receive(:release_broken_bikes)
		van.request_broken_bikes_from(station)
	end
end