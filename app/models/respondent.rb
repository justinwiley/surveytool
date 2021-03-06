class Respondent < ActiveRecord::Base
  attr_accessible :survey, :responses

  belongs_to :survey
  has_many :responses, :dependent => :destroy
  
  def to_s
    "#{id}"
  end
end
