class PortfoliosController < ApplicationController
    def index 
        if params[:profile] and params[:profile][:category_id]
            @profiles=Profile.search(params[:profile][:category_id])
        else
            @profiles= Profile.all
        end
    end

    def show 
    end

    def profile_params
        params.require(:profile).permit(:description, :is_private,:category_id, files: [])
    end
end