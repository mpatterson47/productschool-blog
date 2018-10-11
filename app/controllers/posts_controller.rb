class PostsController < ApplicationController
    before_action :load_post, only: [:show, :edit, :update, :destroy]
   
    def index
        @posts = Post.all
    end
    
    def show
     @comments = @post.comments
     @comment = Comment.new(post: @post)
    end
    
    def new
        @post = Post.new
    end
    
    def create
        
        @post = Post.new post_params
        
        if @post.save
            redirect_to post_path(@post)
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @post.update post_params
            redirect_to post_path(@post)
        else
            render :edit
        end
    end
    
    def destroy
        @post.destroy
        redirect_to root_path
    end
    
    private
    
    def load_post
       @post = Post.find params[:id]
    end
    
    def post_params
     params.require(:post).permit(:title, :body)
    end
     
end