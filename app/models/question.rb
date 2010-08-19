class Question < ActiveRecord::Base
  attr_accessible :survey, :name, :spoken, :range, :answer_type
  QUESTION_TYPES = [['Range','range'],['Multiple Choice','multiple_choice']]

  belongs_to :survey
  has_many :answers, :order => 'position', :dependent => :destroy
  has_many :responses
  
  acts_as_list

  has_attached_file :spoken
  
  validates_presence_of :name

  def multiple_choice?
    answer_type == 'multiple_choice'
  end
  
  def range?
    answer_type == 'range'
  end

  def answer_range
    (1..self.range).to_a
  end

  # ahhhhhh!  DRY DRY DRY
  
  def remove_spoken!
    self.spoken.clear
    self.save!
  end
end
