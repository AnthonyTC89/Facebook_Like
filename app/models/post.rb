# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, as: :likeable
  before_destroy :cleanup
  default_scope -> { order(created_at: :desc) }

  validates :content, presence: true, length: { maximum: 250 }

  private 

  def cleanup
    comments.destroy_all    
  end
end
