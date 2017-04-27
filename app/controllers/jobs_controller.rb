class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @jobs = case params[:order]
    when 'by_lower_bound'
      Job.where(hidden: false).order("wage_lower_bound DESC")
    when 'by_upper_bound'
      Job.where(hidden: false).order("wage_upper_bound DESC")
    else
      Job.where(hidden: false).order("created_at DESC")
    end
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def show
    @job = Job.find(params[:id])

    if @job.hidden
      flash[:warning] = "This Job already archived"
      redirect_to root_path
    end
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to jobs_path, notice: "Job edit success!"
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to jobs_path, alert: "Job deleted!"
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email)
  end

end
