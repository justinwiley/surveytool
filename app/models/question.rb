class Question < ActiveRecord::Base
  attr_accessible :survey, :name, :spoken, :range, :answer_type
  QUESTION_TYPES = [['Range','range'],['Multiple Choice','multiple_choice']]

  belongs_to :survey
  has_many :answers, :order => 'position', :dependent => :destroy
  has_many :responses
  
  acts_as_list :column => 'position'

  has_attached_file :spoken
  
  validates_presence_of :name
  validates_inclusion_of :answer_type, :in => QUESTION_TYPES.map{|i| i.second}
  validates_numericality_of :range, :if => Proc.new{|q| q.answer_type == 'range'}

  def multiple_choice?
    answer_type == 'multiple_choice'
  end
  
  def range?
    answer_type == 'range'
  end

  # ahhhhhh!  DRY DRY DRY
  
  def remove_spoken!
    self.spoken.clear
    self.save!
  end
end
