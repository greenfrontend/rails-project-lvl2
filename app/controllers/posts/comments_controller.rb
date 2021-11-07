# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.post_comments.build(post_comment_params)
      @comment[:user_id] = current_user.id

      if @comment.save
        redirect_to @post, notice: 'Comment was successfully created.'
      else
        redirect_to @post
      end
    end

    private

    def post_comment_params
      params.require(:post_comment).permit(:content, :parent_id)
    end
  end
end
