require 'docking_station'
require 'garage'

describe Garage do

	let(:garage) { Garage.new }
	let(:broken_bike) { double :bike, broken?: true}
	let(:van) {double :van}

	it_behaves_like "BikeContainer"

	it "fixes bikes as soon as it received them" do
		expect(broken_bike).to receive(:fix!)
		garage.dock(broken_bike)
	end
end