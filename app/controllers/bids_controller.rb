class BidsController < ApplicationController
  before_action :get_job, except: [:accept, :reject]
  before_action :authenticate_with_http_digest, except: [:index, :show]
    def index
        
    end
    def new
        @bid = @job.bids.build
    end

    def create 
        @bid = @job.bids.build(bid_params)
        @bid.user_id=Current.user.id
        if @bid.save
        redirect_to jobs_board_path, notice: 'Successfully made a bid, Congratulations!'
        else
          redirect_to jobs_board_path, alert: ' You cant make a new bid since you have already made a bid'
        end
    end


  # PATCH /bids/:id/accept
  # @TODO authorize that the user should actually be allowed the offer
    def accept
      @bid=Bid.find(params[:bid_id])
      if params[:action]=="accept"
        @bid.update!(status: :Accepted)
        redirect_to bids_path, notice: 'Bid is accepted'
        # redirect_to job_path(@bid.job.id), notice: 'Bid is accepted'
        StatusNotification.with(bid: @bid).deliver_later(@bid.user)
       else
       redirect_to bids_path, notice: 'Bid status unsuccessful' 
      end
    end

  # PATCH /bids/:id/reject
  # @TODO authorize that the user should actually be reject the offer

    def reject
      @bid=Bid.find(params[:bid_id])
      if params[:action]=="reject"
        @bid.update!(status: :Rejected)
        redirect_to bids_path, notice: 'Bid is Rejected'
        StatusNotification.with(bid: @bid).deliver_later(@bid.user)

      else
      redirect_to bids_path, notice: 'Bid status unsuccessful' 
      end
    end

    private 
    
    def bid_params
        params.require(:bid).permit(:amount)
    end

    def get_job 
        @job=Job.find(params[:job_id])
    end
end
