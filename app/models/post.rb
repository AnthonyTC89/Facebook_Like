# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  before_destroy :cleanup
  validates :content, presence: true, length: { maximum: 250 }

  private 

  def cleanup
    comments.destroy_all    
  end
end
