module JobsHelper
  def job_author(job)
    Current.user && Current.user.id == job.user_id
  end
end
