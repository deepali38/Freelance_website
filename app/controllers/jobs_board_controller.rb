class JobsBoardController < ApplicationController
    def index
        if params[:job] and params[:job][:category_id]
            @jobs=Job.search(params[:job][:category_id])
        else
          @jobs = Job.all.order("created_at desc")
        end
      end

    def show 
    end
    def job_params 
        params.require(:job).permit(:title, :description,  :location, :job_author, :apply_url, :avatar, :category_id)
    end
end
