module JobsHelper
  def render_job_status(job)
    if job.hidden
      "hideen"
    else
      "open"
    end
  end
end
