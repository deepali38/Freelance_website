class PortfoliosController < ApplicationController
    def index 
        @profiles= Profile.all
    end

    def show 
    end
end