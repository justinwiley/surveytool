class Survey < ActiveRecord::Base
  attr_accessible :name, :spoken, :desc, :questions, :remove_spoken
  
  has_attached_file :spoken

  has_many :questions, :order => 'position', :dependent => :destroy
  has_many :respondents, :dependent => :destroy

  validates_presence_of :name
  
  def remove_spoken!
    self.spoken.clear
    self.save!
  end
end
