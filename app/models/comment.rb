# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable
  before_destroy :cleanup

  validates :content, presence: true

  private

  def cleanup
    likes.destroy_all
  end
end
