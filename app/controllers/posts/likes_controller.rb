# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    def create
      return redirect_to user_session_path, notice: 'You should be signed in' unless current_user

      @like = post.likes.build(user: current_user)
      @like.save

      redirect_to post_path(post)
    end

    def destroy
      @like = post.likes.find_by!(id: params[:id])
      @like.destroy

      redirect_to post_path(post)
    end

    private

    def post
      @post = Post.find(params[:post_id])
    end
  end
end
