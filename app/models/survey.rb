class Survey < ActiveRecord::Base
  attr_accessible :name, :spoken, :desc, :questions, :remove_spoken, :created_at
  
  has_attached_file :spoken

  has_many :questions, :order => 'position', :dependent => :destroy
  has_many :respondents, :dependent => :destroy
  has_many :responses, :through => :respondents

  validates_presence_of :name
  
  def remove_spoken!
    self.spoken.clear
    self.save!
  end

  def orphaned_questions?
    !orphaned_questions.empty?
  end

  def orphaned_questions
    questions.map do |q|
      q if q.multiple_choice? && q.answers.empty?
    end.compact
  end
  
  def to_s
    name
  end
  
  def average_response_time
    respondents = responses.select('respondents.created_at as start_time,max(responses.created_at) as end_time').group('respondents.id')
    return "No respondent data" unless respondents.count
    respondents.inject(nil) do |r,sum|
      next if r.start_time.blank? || r.end_time.blank?
      r.created_at.to_f - r.start_time.to_f
    end
    Time.at(sum / respondents.count).to_s
  end


  def total_respondents_on(date)
    respondents.where("DATE_FORMAT(created_at,'%Y-%m-%d') = ?", date).count
  end
end
