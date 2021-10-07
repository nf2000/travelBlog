class CommentsController < ApplicationController
    before_action :find_post

    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
    end
  
    def create
        @comment = Comment.new(comment_param)  
        @comment.post_id = @post.id
        comment_is_valid = @comment.valid? 
        if comment_is_valid
            @comment.save
            #flash[:notice] =  "Comment successfully created." 
            return redirect_to post_path("#{@comment.post_id}"), success: "Comment successfully created."

        else
            flash.now[:danger] = "comment was not created"
            render 'new'

        end  
       
    end

    private
    def comment_param
    params.require(:comment).permit(:comment,:name,:post_id)
    end

    private 
    def find_post
        @post = Post.find(params[:post_id])
    end
end
