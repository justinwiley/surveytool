class QuestionsController < ApplicationController
  before_filter :find_survey, :only => [:index,:new,:create,:edit,:update,:destroy,:remove_spoken]
  before_filter :find_question, :only => [:edit,:update,:destroy,:remove_spoken]

  def index
    @questions = Question.all
  end
  
  def new
    @question = @survey.questions.build
  end
  
  def create
    @question = @survey.questions.build(params[:question])
    if @question.save
      flash[:notice] = "Successfully created question."
      redirect_to @survey
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @question.update_attributes(params[:question])
      flash[:notice] = "Successfully updated question."
      redirect_to edit_survey_question_path(@survey, @question)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @question.destroy
    flash[:notice] = "Successfully destroyed question."
    redirect_to survey_path(@survey)
  end
  
  def remove_spoken
    if @question.remove_spoken!
      flash[:notice] = "Audio file removed."
      redirect_to edit_survey_question_path(@survey, @question)
    else
      flash[:error] = "Audio file could not be removed."
    end
  end
  
  private
    def find_survey
      @survey = Survey.find(params[:survey_id])
    end
  
    def find_question
      @question = Question.find(params[:id])
    end
end
