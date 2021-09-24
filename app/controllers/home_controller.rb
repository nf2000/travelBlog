class HomeController < ApplicationController

    def index
        @posts = Post.all
    end
    def new
        @post = Post.new
    end
  
    def create
    @post = Post.new(post_param)
      if @post.save
        redirect_to '/home'
      else
        render 'new'
        end
    end
  
    private
    def post_param
    params.require(:post).permit(:title, :author, :category, :content)
    end
end
