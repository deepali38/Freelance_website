# To deliver this notification:
#
# BidNotification.with(post: @post).deliver_later(current_user)
# BidNotification.with(post: @post).deliver(current_user)

class BidNotification < Noticed::Base
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
    @user=User.find(@bid.user_id)
    "#{@user.name_or_company_name} bid on #{@job.title.truncate(10)}"
  end
  #
  def url
  job_path(Job.find(params[:bid][:job_id]))
  end
end
