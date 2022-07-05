class PostController <ApplicationController 
    def index
        @jobs = Job.all.order("created_at desc").limit(4)
    end
end