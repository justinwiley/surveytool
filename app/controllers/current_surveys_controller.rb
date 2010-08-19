class CurrentSurveysController < ApplicationController
  before_filter :find_survey

  def show
  end

  # acts_as_list higher_item should work, but doesnt. Rails 3 bug?
  def start
    @survey = Survey.find params[:survey_id]
    @display_question = @survey.questions.where(:position => 1).first
    @respondent = Respondent.create! :survey => @survey, :question => @display_question
    session[:respondent_id] = @respondent.id
    @next_question = @display_question.lower_item
    render 'question'
  end

  def display_question
    @respondent = Respondent.find(session[:respondent_id])
    @survey = @respondent.survey
    current_question = @survey.questions.find(params[:question_id])
    response = Response.find_or_create_by_question_id_and_respondent_id(current_question.id, @respondent.id)
    if params[:range]
      response.update_attributes(:range => params[:range])
    elsif params[:answer]
      response.update_attributes(:answer_id => params[:answer])
    end
    if params[:range].blank? && params[:answer].blank?
      flash[:error] = "You must select an answer for this question."
    else
      flash[:notice] = "Answer saved."
    end
    
    @display_question = if !flash[:error].blank?
      current_question
    elsif params[:commit] == 'Next Question'
      current_question.lower_item
    elsif params[:commit] == 'Previous Question'
      current_question.higher_item
    end

    if params[:commit] == 'Finish' && flash[:error].blank?
      redirect_to finish_url(@survey)
    else
      @next_question = @display_question.lower_item
      @previous_question = @display_question.higher_item
      flash[:notice] = "Answer saved."
      render 'question'
    end
  end
  
  def finish
  end

  private
    def find_survey
      @survey = Survey.find params[:survey_id]
    end
end