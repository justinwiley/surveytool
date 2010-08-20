class ReportsController < ApplicationController
  def survey
    @survey = Survey.find(params[:survey_id])
  end
end