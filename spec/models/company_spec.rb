require 'spec_helper'

describe Company do
  let(:company) {Company.new(name: "ThoughtBot")}

  it 'is valid' do
    expect(company).to be_valid
  end

  it 'is not valid without a name' do
    company.name = nil
    expect(company).to_not be_valid
  end

  it 'has an array of phone numbers' do
    expect(company.phone_numbers).to eq([])
  end

  it "responds with its phone numbers after they're created" do
    phone_numbers = company.phone_numbers.build(number: "555-3456")
    expect(company.phone_numbers.map(&:number)).to eq(["555-3456"])
  end

  it "responds with its email addresses after they're created" do
    email_addresses = company.email_addresses.build(address: 'hello@example.com')
    expect(company.email_addresses.map(&:address)).to eq(['hello@example.com'])
  end
end
