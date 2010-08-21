class ReportsController < ApplicationController
  def survey
    @survey = Survey.find(params[:survey_id])
  end
  
  def question
    @question = Question.find(params[:question_id])
  end
end