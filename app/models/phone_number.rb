class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :person_id

  validates_presence_of :number
end
