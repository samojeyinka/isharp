class PagesController < ApplicationController
    def index 
        @posts = Post.order("RANDOM()")   
    end
    def about
    end

    def helpsupport
    end

    def contact
    end
end
