class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :reactions, as: :reactionable

  has_many_attached :pictures, dependent: :destroy
  validates :pictures, content_type: %i[png jpg jpeg]

  validates :title, presence: true
  validates :user_id, presence: true

end
