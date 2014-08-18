require 'person'

describe Person do
	let(:person) { Person.new }

	it "should not have a bike by default" do
		expect(person).not_to have_bike
	end

	it "should be able to have a bike" do
		person_with_bike = Person.new(:bike)
		expect(person_with_bike).to have_bike
	end
end