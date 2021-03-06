class SurveysController < ApplicationController
  before_filter :find_survey, :only => [:show,:edit,:update,:destroy, :remove_spoken]

  def index
    @surveys = Survey.all
  end
  
  def show
  end
  
  def new
    @survey = Survey.new
  end
  
  def create
    @survey = Survey.new(params[:survey])
    if @survey.save
      flash[:notice] = "Successfully created survey."
      redirect_to @survey
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @survey.update_attributes(params[:survey])
      flash[:notice] = "Successfully updated survey."
      redirect_to @survey
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @survey.destroy
    flash[:notice] = "Successfully destroyed survey."
    redirect_to surveys_url
  end
  
  def remove_spoken
    if @survey.remove_spoken!
      flash[:notice] = "Audio file removed."
      redirect_to @survey
    else
      flash[:error] = "Audio file could not be removed."
    end
  end
  
  private
    def find_survey
      @survey = Survey.find(params[:id])
    end
end
