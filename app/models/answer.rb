class Answer < ActiveRecord::Base
  attr_accessible :name, :text, :spoken

  belongs_to :question
  acts_as_list :scope => :question
  
  has_attached_file :spoken
  
  validates_presence_of :name
  validates_presence_of :text
  
  def to_s
    self.name
  end
  
  def remove_spoken!
    self.spoken.clear
    self.save!
  end
end
