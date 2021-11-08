# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    def create
      return redirect_to user_session_path, notice: 'You should be signed in' unless current_user

      post = Post.find(params[:post_id])
      like = post.likes.build
      like[:user_id] = current_user.id

      if like.save
        redirect_to post
      else
        redirect to post
      end
    end

    def destroy
      post = Post.find(params[:post_id])
      like = post.likes.find_by(id: params[:id])

      if like.destroy
        redirect_to post
      else
        redirect to post
      end
    end
  end
end
