class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
    end 

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            flash[:success] =  "'#{@post.title}' successfully deleted."  
            redirect_to root_path 
        else
            flash.now[:danger] = "could not delete blog post"
            render 'show'
        end
    end

    def new
        @post = Post.new
        @comment = Comment.new[post_id: params[:post_id]]
    end
  
    def create
        @post = Post.new(post_param)  #using the @ means the variable can be used in the view. A new instances post is created 
        post_is_valid = @post.valid? #checking if the post fields are filled in 
        if post_is_valid  

            @post.save # saves the parameters inside the database
            return redirect_to posts_path, success: "Post created successfully"
        else
            flash.now[:danger] = "Post could not be created"
            render 'new'
        end  
    end

    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])

        if @post.update(post_param)
            flash[:success] =  "'#{@post.title}' successfully updated."  
            redirect_to root_path
        else
            flash.now[:danger] = "unable to update blog"
            render 'edit'
        end
    end

    private
    def post_param
        params.require(:post).permit(:title, :author, :category, :content)
    end
end
