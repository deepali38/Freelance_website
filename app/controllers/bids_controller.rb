class BidsController < ApplicationController
  before_action :authenticate_with_http_digest, except: [:index, :show]
  before_action :require_user_logged_in!
  before_action :get_job, except: [:accept, :reject, :index]
  before_action :find_bid, only: [:accept, :reject]

  def new
    @bid = @job.bids.build
  end

  def create 
    @bid = @job.bids.build(bid_params)
    @bid.user_id=Current.user.id
    if @bid.save
      redirect_to jobs_board_index_path, notice: 'Successfully made a bid, Congratulations!'
    else
      redirect_to jobs_board_index_path, alert: ' You cant make a new bid since you have already made a bid'
    end
  end

  def accept
    if params[:action]=="accept"
      @bid.update!(status: :Accepted)
      redirect_to job_path(@bid.job_id), notice: 'Bid is accepted'
      StatusNotification.with(bid: @bid).deliver_later(@bid.user)
    else
      redirect_to jobs_path, notice: 'Bid status unsuccessful' 
    end
  end

  def reject
    if params[:action]=="reject"
      @bid.update!(status: :Rejected)
      redirect_to job_path(@bid.job_id), notice: 'Bid is Rejected'
      StatusNotification.with(bid: @bid).deliver_later(@bid.user)
    else
      redirect_to jobs_path, notice: 'Bid status unsuccessful' 
    end
  end

  private 
  
  def bid_params
    params.require(:bid).permit(:amount)
  end

  def find_bid 
    @bid=Bid.find(params[:bid_id])
  end

  def get_job 
    @job=Job.find(params[:job_id])
  end
end
