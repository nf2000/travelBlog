class CommentsController < ApplicationController

    def new
        @comment =  Comment.new
    end
  
    def create
        @comment = Comment.new(comment_param)  
        post_is_valid = post.valid? 
        if post_is_valid  
            post.save
           return redirect_to posts_path

        else
            flash.now[:alert] = "Unable to create a comment"
            render 'new'
        end  
       
    end

    private
    def comment_param
    params.require(:comment).permit(:comment)
    end
end
