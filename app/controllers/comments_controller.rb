class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def new

        @comment = Comment.new

    end

  
    def create
        @comment = Comment.new(comment_param)  
        comment_is_valid = comment.valid? 
        if comment_is_valid
            @comment.save
            return redirect_to root_path

        else
            flash.now[:alert] = "Unable to create a comment"
            render 'new'


        end  
       
    end

    private
    def comment_param
    params.require(:comment).permit(:comment,:post_id)#.merge(post_id: params[:post_id])
    end
end
