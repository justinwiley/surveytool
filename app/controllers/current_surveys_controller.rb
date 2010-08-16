class CurrentSurveysController < ApplicationController
   before_filter :find_survey

   def show
   end

   def start
     @question = @survey.questions.first
     render 'question'
   end
   
   def next_question
     render 'question'
   end
   
   def find_survey
    @survey = Survey.find params[:survey_id]
   end
end