class CommentsController < ApplicationController


    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
    end
end
