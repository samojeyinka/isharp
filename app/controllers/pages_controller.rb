class PagesController < ApplicationController
    def index 
        @posts = Post.order("RANDOM()").paginate(page: params[:page], per_page: 10)  
    end
    def about
    end

    def helpsupport
    end

    def contact
    end
end
