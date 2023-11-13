class Post < ApplicationRecord
 belongs_to :user
 has_many :post_comments, dependent: :destroy
 has_many :favorites, dependent: :destroy
 has_many :favorited_users, through: :favorites, source: :user
 belongs_to :category
 #通知機能
 has_one :notification, as: :subject, dependent: :destroy
 
 scope :latest, -> {order(created_at: :desc)}
 scope :old, -> {order(created_at: :asc)}
 scope :most_favorited, -> { includes(:favorited_users)
  .sort_by { |x| x.favorited_users.includes(:favorites).size }.reverse }
 
 def favorited_by?(user)
  favorites.exists?(user_id: user.id)
 end
 
  def self.search(content)
    Post.where("body LIKE? or title LIKE?","%#{content}%", "%#{content}%")
  end
end
