class CurrentSurveysController < ApplicationController
  before_filter :find_survey

  def show
  end

  # acts_as_list higher_item should work, but doesnt. Rails 3 bug?
  def start
    @survey = Survey.find params[:survey_id]
    @question = @survey.questions.where(:position => 1).first
    @respondent = Respondent.create! :survey => @survey, :question => @question
    session[:respondent_id] = @respondent.id
    @next_question = higher_item(@question)
    render 'question'
  end

  def display_question
    @respondent = Respondent.find(session[:respondent_id])
    @survey = @respondent.survey
    current_question = @survey.questions.find(params[:question_id])
    response = Response.find_or_create_by_question_id_and_respondent_id(current_question.id, @respondent.id)
    if params[:range]
      response.update_attributes(:range => params[:range])
    end
    @next_question = higher_item(current_question)
    @previous_question = lower_item(current_question)
    @question = params[:commit] == 'Next Question' ? @next_question : @previous_question
    flash[:notice] = "Answer saved."
    render 'question'
  end

  private
    def find_survey
      @survey = Survey.find params[:survey_id]
    end
    
    def higher_item(question)
      Question.find_by_position(question.position + 1)
    end
    
    def lower_item(question)
      Question.find_by_position(question.position - 1)
    end
end