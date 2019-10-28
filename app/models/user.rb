# frozen_string_literal: true

class User < ApplicationRecord
  include Gravtastic
  gravtastic
  has_many :posts
  has_many :comments, through: :posts
  before_destroy :cleanup

  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.name
      user.image_link = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info'])
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.find_or_create_by_omniauth(auth_hash)
    where(email: auth_hash['info']['email']).first_or_create do |u|
      u.name = auth_hash['info']['name']
      u.password = SecureRandom.hex
    end
  end

  def friends
    friends_array = []
    friends_array << friendships.map { |friendship| friendship.friend if friendship.confirmed }
    friends_array << inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    friends_array.flatten.compact
  end

  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find { |f| f.user == user }
    friendship.confirmed = true
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end

  private

  def cleanup
    posts.destroy_all
  end
end
