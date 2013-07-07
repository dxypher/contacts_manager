class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  include Contact
  validates_presence_of :first_name, :last_name
end
