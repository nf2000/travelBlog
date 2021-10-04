class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def new

        @comment = Comment.new

    end

  
    def create
        comment = Comment.new(comment_param)  
        comment_is_valid = comment.valid? 
        if comment_is_valid
            comment.save
            flash[:notice] =  "Comment successfully created." 
            return redirect_to post_path("#{comment_param[:post_id]}")

        else
            flash.now[:alert] = "Comment can not be made"

            render 'new'

        end  
       
    end

    private
    def comment_param
    params.require(:comment).permit(:comment,:post_id)
    end
end
