class ResumesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]


  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job

    if @resume.save
      redirect_to job_path(@job), notice:"简历已成功上传!"
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to job_path(@job), alert:"简历删除成功!"
  end

  private

  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
end
