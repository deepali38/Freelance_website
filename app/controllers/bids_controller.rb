class BidsController < ApplicationController
  before_action :get_job
  before_action :set_bid, only: %i[show]
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
    
    private 
    
    def bid_params
        params.require(:bid).permit(:amount)
    end

    def get_job 
        @job=Job.find(params[:job_id])
    end

    def set_bid
        @bid=@job.bids.find(params[:id])
    end
    
end
