class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :reactions, as: :reactionable

  has_one_attached :picture, dependent: :destroy
  validates :picture, content_type: %i[png jpg jpeg]

  validates :title, presence: true
  validates :user_id, presence: true
end
