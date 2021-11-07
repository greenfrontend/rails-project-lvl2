# frozen_string_literal: true

class PostCategory < ApplicationRecord
  validates :name, presence: true
end
