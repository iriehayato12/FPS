class Post < ApplicationRecord
 belongs_to :user
 has_many :post_comments, dependent: :destroy
 has_many :favorites, dependent: :destroy
 belongs_to :category
 #通知機能
 has_one :notification, as: :subject, dependent: :destroy
 
 def favorited_by?(user)
  favorites.exists?(user_id: user.id)
 end
 
  def self.search(content)
    Post.where("body LIKE? or title LIKE?","%#{content}%", "%#{content}%")
  end
end
