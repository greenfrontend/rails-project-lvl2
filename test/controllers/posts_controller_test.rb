# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in(@user)
  end

  test 'should get index' do
    get root_path

    assert_response :success
  end

  test 'should show post' do
    post = posts(:one)

    get post_path(post)

    assert_select 'h1', post.title.strip
    assert_response :success
  end

  test 'should create post' do
    get new_post_path

    post posts_path, params: { post: { title: 'new title', body: 'body', post_category_id: post_categories(:one).id } }

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'h1', 'new title'
  end
end
