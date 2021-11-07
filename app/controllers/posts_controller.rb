# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.create(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end
end
