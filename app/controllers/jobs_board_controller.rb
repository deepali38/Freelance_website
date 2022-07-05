class JobsBoardController < ApplicationController
    def index
          @jobs = Job.all.order("created_at desc")
      end
end