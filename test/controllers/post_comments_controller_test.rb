# frozen_string_literal: true

require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in(@user)
  end

  test 'should create coment' do
    first_post = posts(:one)

    post post_comments_path(first_post), params: { post_comment: { content: 'wow!' } }

    assert_response :redirect
    follow_redirect!
    assert_response :success

    assert_match 'wow!', response.body
  end
end
