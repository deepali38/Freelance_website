# To deliver this notification:
#
# StatusNotification.with(post: @post).deliver_later(current_user)
# StatusNotification.with(post: @post).deliver(current_user)

class StatusNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @job=Job.find(params[:bid][:job_id])
    @bid=Bid.find(params[:bid][:id])
    @user=User.find(@job.user_id)
    "#{@user.name_or_company_name} #{@bid.status} on #{@job.title.truncate_words(10)}"
  end
  #
  def url
    jobs_path
  end
end
