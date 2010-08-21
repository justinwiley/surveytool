class ReportsController < ApplicationController
  before_filter :find_survey, :only => [:survey,:export_csv]

  def survey
  end
  
  def question
    @question = Question.find(params[:question_id])
  end
  
  def export_csv
    send_data(@survey.export_csv, :type => 'text/csv; charset=iso-8859-1; header=present',
      :disposition => "attachment", :filename => "#{@survey.name.downcase.gsub(/ /,'_') + Date.today.to_s}.csv")
  end

  private
    def find_survey
      @survey = Survey.find(params[:survey_id])
    end
end