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

  it 'responds with its created phone numbers' do
    person.phone_numbers.build(number: '555-8333')
    expect(person.phone_numbers.map(&:number)).to eq(['555-8333'])
  end

  it 'responds with its created email addresses' do
    person.email_addresses.build(address: "hello@example.com")
    expect(person.email_addresses.map(&:address)).to eq(['hello@example.com'])
  end
end
