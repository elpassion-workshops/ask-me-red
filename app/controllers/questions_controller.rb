class QuestionsController < ApplicationController
  def index
    @questions = Question.page(params[:page]).per(10).order("created_at desc")
  end

  def new
  	@question = Question.new
  end

  def create
  	@question = current_user.questions.build(question_params)

  	if @question.save
  	  redirect_to question_path(@question), notice: 'Question was successfully created.'
  	else
  		redirect_to new_question_path(@question), notice: 'Title and content must be filled in.'
  	end
  end

  def show
  	@question = Question.find(params[:id])
  end

  private

  def question_params
  	params.require(:question).permit(:title, :content, :tag_list)
  end
end