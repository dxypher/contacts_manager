require 'spec_helper'

describe EmailAddress do
  let(:email_address) {EmailAddress.new(address: "john@example.com", contact_id: 1, contact_type: "Person" )}

  it 'is valid' do
    expect(email_address).to be_valid
  end

  it 'is not valid without an address' do
    email_address.address = nil
    expect(email_address).to_not be_valid
  end

  it 'is not valid without a contact_id' do
    email_address.contact_id = nil
    expect(email_address).to_not be_valid
  end
end
