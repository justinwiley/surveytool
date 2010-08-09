class Survey < ActiveRecord::Base
  has_many :questions
  attr_accessible :name, :spoken, :desc, :questions

  validates_presence_of :name

end
