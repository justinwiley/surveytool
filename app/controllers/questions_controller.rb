class QuestionsController < ApplicationController
  before_filter :find_survey
  before_filter :find_question, :only => [:edit,:update,:destroy]

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
      redirect_to [@survey, @ticket]
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @question.update_attributes(params[:question])
      flash[:notice] = "Successfully updated question."
      redirect_to @survey
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @question.destroy
    flash[:notice] = "Successfully destroyed question."
    redirect_to survey_path(@survey)
  end

  private
    def find_question
      @question = Question.find(params[:id])
    end
    
    def find_survey
      @survey = Survey.find(params[:survey_id])
    end
end
