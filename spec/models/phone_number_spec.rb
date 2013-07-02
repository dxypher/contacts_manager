require 'spec_helper'

describe PhoneNumber do
  let(:phone_number) { PhoneNumber.new(number: '5555555555', person_id: 1) }

  it 'is valid' do
    expect(phone_number).to be_valid
  end

  it 'is invalid without a number' do
    phone_number.number = nil
    expect(phone_number).not_to be_valid
  end

  it "must have a reference to a person" do
    phone_number.person_id = nil
    expect(phone_number).not_to be_valid
  end
end
