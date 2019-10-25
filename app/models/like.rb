# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  validates_uniqueness_of :user_id, scope: %i[likeable_id likeable_type]
end
