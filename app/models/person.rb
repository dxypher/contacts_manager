class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  has_many :phone_numbers

  validates_presence_of :first_name, :last_name
end
