class Company < ActiveRecord::Base
  attr_accessible :name

  include Contact
  
  validates_presence_of :name

  def to_s
    "#{name}"
  end
end
