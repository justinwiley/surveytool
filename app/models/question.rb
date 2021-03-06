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

  def bardata
    data = range? ? responses_by_answer.map{|q| q.second} : responses_by_answer.to_a
    data.inspect
  end

  def piedata
    responses_by_answer_percentage.inspect
  end

  def spline_categories(start_date,end_date)
    (start_date..end_date).to_json
  end

  def spline_series(start_date,end_date)
    answers = {}
    (start_date..end_date).each do |date|
      total_responses_on(date).each do |k,v|
        if multiple_choice?
          ans = Answer.find(k)
          k = "#{ans.name} - #{ans.text}"
        end
        answers[k] ||= []
        answers[k] << v
      end
    end
    answers.map{|k,v| {:name => k, :data => v}}.sort{|a,b| a[:name] <=> b[:name]}.to_json
  end

  def total_responses_on(date)
    if range?
      responses.where("DATE_FORMAT(created_at,'%Y-%m-%d') = ?", date).group('responses.range').count
    else
      responses.where("DATE_FORMAT(created_at,'%Y-%m-%d') = ?", date).group('responses.answer_id').count
    end
  end

  def bar_categories
    categories = range? ? (1..range).map{|r| "Answer #{r}"} : answers.map{|r| r.name}
    categories.inspect
  end
  
  def responses_by_answer_percentage
    total_responses = responses.count
    if range?
      responses_by_answer.map{|k,v| ["%2.2f%%" % ((v.to_f / total_responses.to_f) * 100),v]}
    else
      answers.map do |a|
        answer_responses = a.responses.count
        ["%2.2f%%" % ((answer_responses.to_f / total_responses.to_f) * 100),answer_responses]
      end
    end
  end

  def responses_by_answer
    if range?
      responses.group('responses.range').count
    else
      answers.map{|a| a.responses.count}
    end
  end

  def remove_spoken!
    self.spoken.clear
    self.save!
  end
end
