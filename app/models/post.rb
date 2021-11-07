class Post < ApplicationRecord
  belongs_to :user
  belongs_to :post_category

  validates :title, :body, presence: true
end
