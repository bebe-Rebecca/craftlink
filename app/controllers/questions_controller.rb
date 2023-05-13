class QuestionsController < ApplicationController
  def new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to job_path(@question.job)
    else
    end
  end

  private
  def question_params
    params.require(:question).permit(:name, :title, :content).merge(user_id: current_user.id, job_id: params[:job_id])
  end
end
