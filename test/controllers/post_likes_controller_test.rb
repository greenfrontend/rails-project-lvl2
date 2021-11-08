# frozen_string_literal: true

require 'test_helper'

class PostLikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in(@user)
  end

  test 'should create like' do
    first_post = posts(:one)

    assert_difference('PostLike.count', 1) do
      post post_likes_path(first_post), params: { post_like: { post_id: first_post.id } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test 'should destroy like' do
    second_post = posts(:two)

    assert_difference('PostLike.count', -1) do
      delete post_like_path(second_post, post_likes(:two).id), params: { post_like: { post_id: second_post.id } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
