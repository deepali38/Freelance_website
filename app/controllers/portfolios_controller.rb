# frozen_string_literal: true

class PortfoliosController < ApplicationController
  def index
    @profiles = if params[:profile] && params[:profile][:category_id]
                  Profile.search(params[:profile][:category_id])
                else
                  Profile.all
                end
  end

  def show; end

  def profile_params
    params.require(:profile).permit(:description, :is_private, :category_id, files: [])
  end
end
