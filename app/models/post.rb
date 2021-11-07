# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', inverse_of: :posts
  belongs_to :post_category

  validates :title, :body, presence: true
end
