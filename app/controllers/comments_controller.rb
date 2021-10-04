class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def new

        @comment = Comment.new

    end

  
    def create
        comment = @post.Comment.new(comment_param)  
        comment_is_valid = comment.valid? 
        if comment_is_valid  
            comment.save
           return redirect_to posts_path(params[:post_id])

        else
            flash.now[:alert] = "Unable to create a comment"
            render 'new'
        end  
       
    end

    private
    def comment_param
    params.require(:comment).permit(:comment).merge(post_id: params[:post_id])
    end
end
