class Question < ActiveRecord::Base
  QUESTION_TYPES = [['Range','range'],['Multiple Choice','multiple_choice']]

  belongs_to :survey
  has_many :answers
  has_attached_file :spoken
  
  attr_accessible :survey, :name, :spoken, :range, :answer_type
  
  validates_presence_of :name

  # ahhhhhh!  DRY DRY DRY
  
  def remove_spoken!
    self.spoken.clear
    self.save!
  end
end
