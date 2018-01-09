class QuestionsController < ApplicationController
 #index
  def index
    @questions = Question.all
  end
#show
  def show
    @question = Question.find(params[:id])
  end
#new
  def new
    @question = Question.new 
  end
#create
  def create
    @question = Question.new(params.require(:question).permit(:title, :body, :resolved))
    if @question.save 
      flash[:notice]= "Question was saved."
      redirect_to @question 
    else 
      flash[:alert] = "There was an error saving the question. Please try again."
      render :new 
    end
  end
#edit
  def edit
    @question = Question.find(params[:id])
  end
#update
  def update 
    @question = Question.find(params[:id])
    if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
      flash[:notice] = "Question was updated."
      redirect_to @question 
    else 
      flash[:alert] = "There was an error saving the question. Please try again."
      render :edit 
    end
  end
#destroy 
  def destroy
    @question = Question.find(params[:id])

    if @question.destroy
      flash[:notice] = "\"#{@question.title}\" was deleted successfully."
      redirect_to questions_path
    else 
      flash[:error] = "There was an error deleting the question."
      render :show 
    end
  end
end
