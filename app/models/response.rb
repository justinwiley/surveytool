class Response < ActiveRecord::Base
  belongs_to :respondent
  belongs_to :question
  belongs_to :answer
end
