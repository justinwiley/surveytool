class Question < ActiveRecord::Base
  attr_accessible :survey, :name, :spoken, :range, :answer_type
  QUESTION_TYPES = [['Range','range'],['Multiple Choice','multiple_choice']]

  belongs_to :survey
  has_many :answers, :order => 'position', :dependent => :destroy
  has_many :responses
  
  acts_as_list

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

  def responses_by_answer
    if range?
      total_responses = responses.count
      responses.group('responses.range').count.map{|k,v| ["%2.2f%%" % ((v.to_f / total_responses.to_f) * 100),v]}
    else
#      responses.group('responses.range').count
    end
  end

  # ahhhhhh!  DRY DRY DRY
  
  def remove_spoken!
    self.spoken.clear
    self.save!
  end
end
