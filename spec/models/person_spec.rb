require 'spec_helper'

describe Person do
  let(:person) do
    Person.new(first_name: "John", last_name: "Doe")
  end

  it "is valid" do
    expect(person).to be_valid
  end

  it 'is invalid without a first name' do
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it 'is invalid without a last name' do
    person.last_name = nil
    expect(person).not_to be_valid
  end
end
