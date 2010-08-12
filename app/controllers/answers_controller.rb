class AnswersController < ApplicationController
  before_filter :find_survey, :only => [:create,:edit,:new]
  before_filter :find_question
  before_filter :find_answer, :only => [:edit,:update,:destroy,:remove_spoken]
  
  def new
    @answer = @question.answers.build
  end
  
  def create
    @answer = @question.answers.build(params[:answer])
    if @answer.save
      flash[:notice] = "Successfully created answer."
      redirect_to_question_edit
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @answer.update_attributes(params[:answer])
      flash[:notice] = "Successfully updated answer."
      redirect_to_question_edit
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @answer.destroy
    flash[:notice] = "Successfully deleted answer."
    redirect_to_question_edit
  end
  
  def remove_spoken
    if @answer.remove_spoken!
      flash[:notice] = "Audio file removed."
      redirect_to_question_edit
    else
      flash[:error] = "Audio file could not be removed."
    end
  end
  
  private
    def redirect_to_question_edit
      redirect_to edit_survey_question_path(params[:survey_id],@question)
    end

    def find_survey
      @survey = Survey.find(params[:survey_id])
    end
    
    def find_question
      @question = Question.find(params[:question_id])
    end
    
    def find_answer
      @answer = Answer.find(params[:id])
    end
end
