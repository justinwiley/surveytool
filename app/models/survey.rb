class Survey < ActiveRecord::Base
  has_attached_file :spoken

  has_many :questions, :dependent => :destroy

  attr_accessible :name, :spoken, :desc, :questions, :remove_spoken

  validates_presence_of :name
  
  def remove_spoken!
    self.spoken.clear
    self.save!
  end
end
