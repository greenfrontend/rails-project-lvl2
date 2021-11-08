# frozen_string_literal: true

module PostsHelper
  def destroy_like?(likes, user)
    user_id = (user || {})[:id]
    likes.find { |like| like[:user_id].equal? user_id }
  end
end
