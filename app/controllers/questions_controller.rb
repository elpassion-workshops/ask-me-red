class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
  	@question = Question.new
  end

  def create
  	@question = current_user.questions.build(question_params)
  	@question.save

  	 redirect_to question_path(@question)
  end

  def show
  	@question = Question.find(params[:id])
  end

  private

  def question_params
  	params.require(:question).permit(:title, :content)
  end
end