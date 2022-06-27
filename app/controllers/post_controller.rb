class PostController <ApplicationController 
    def index
    end

    def about
        @about_me = "My Name is Deepali"
  	    @answer = 2 + 2
    end

end