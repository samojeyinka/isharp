class PostsController < ApplicationController
   before_action :find_params, only:[:show, :edit, :update,:destroy]
 def index
    @posts = Post.all   
 end

 def new
   @post = Post.new
 end

 def create
   @post = Post.new(post_inputs)
   if @post.save
      flash[:notice] = "Post created successfully"
     redirect_to @post
   else
     render 'new'
 end
end

def show
  
end

def edit
   
end

def update

   if @post.update(post_inputs)
      flash[:notice] = "Post updated successfully"
      redirect_to @post
      else
         render 'edit'
   end
end


 def destroy

   @post.destroy
   flash[:notice] = "Post deleted successfully"
   redirect_to posts_path
end


private

def find_params
   @post = Post.find(params[:id])
end

def post_inputs
   params.require(:post).permit(:title, :content, :thumbnail)
end
 
end