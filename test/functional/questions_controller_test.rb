require File.dirname(__FILE__) + '/../spec_helper'
 
describe QuestionsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Question.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Question.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Question.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(question_url(assigns[:question]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Question.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Question.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Question.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Question.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Question.first
    response.should redirect_to(question_url(assigns[:question]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    question = Question.first
    delete :destroy, :id => question
    response.should redirect_to(questions_url)
    Question.exists?(question.id).should be_false
  end
end
