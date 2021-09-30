class PostsController < ApplicationController

    def index
       
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])

    end 

    def destroy
        @post = Post.find(params[:id])
            if @post.destroy
                flash[:notice] =  "'"+ @post.title + "'" +" successfully deleted."  
                redirect_to root_path
            else
                flash.now[:alert] = "could not delete blog post"
                render 'show'
            end
    end

    def new
        @post = Post.new
    end
  
    def create
        post = Post.new(post_param)  #using the @ means the variable can be used in the view. A new instances post is created 
        post_is_valid = post.valid? #checking if the post fields are filled in 
        if post_is_valid  
            post.save # saves the parameters inside the database
           return redirect_to '/posts' 
        else
            render 'new'
        end  
       
    end

  
    private
    def post_param
    params.require(:post).permit(:title, :author, :category, :content)
    end
end
