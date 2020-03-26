class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :relationship_likes, dependent: :destroy
  has_many :liked_by, through: :relationship_likes, source: :user
  default_scope -> {order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, length: {maximum: 140}
  validates :picture, presence: true
  validate :picture_size
  
  def self.search(search)
    if search
      where(['content LIKE ?', "%#{search}%"])
    else
      all
    end
  end
  
  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "５MB以下にしてください")
    end
  end
end
