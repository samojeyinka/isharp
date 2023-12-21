class PostsController < ApplicationController
   before_action :find_params, only:[:show, :edit, :update,:destroy]
   before_action :require_user, except: [:index, :show]
   before_action :require_exact_user, only: [:edit, :update, :destroy]
   
 def index
   #  @posts = Post.all  
   @posts = Post.order(:created_at).reverse_order.paginate(page: params[:page], per_page: 10) 
 end

 def new
   @post = Post.new
 end

 def create
   @post = Post.new(post_inputs)
   @post.user = current_user
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
   params.require(:post).permit(:title, :content, :thumbnail, category_ids:[])
end

def require_exact_user
   if current_user != @post.user
      flash[:alert] = "You do not have permission to perform this action"
         redirect_to @post
      end
end
 
end