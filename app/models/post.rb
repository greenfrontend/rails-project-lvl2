# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', inverse_of: :posts
  belongs_to :post_category
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy

  validates :title, :body, presence: true
end
