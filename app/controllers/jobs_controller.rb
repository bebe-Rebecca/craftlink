class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_job, only: [:show]

  def index
    @jobs = Job.all.order('created_at DESC')
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def job_params
    params.require(:job).permit(:job_title, :workshop_name, :description, :origin_to_prefecture_id, :image).merge(user_id: current_user.id)
  end
  
  def set_job
    @job = Job.find(params[:id])
  end
end
