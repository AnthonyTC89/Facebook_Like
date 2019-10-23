# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 250 }
  default_scope { order(created_at: :desc) }
end
