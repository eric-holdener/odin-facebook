class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :reactions, as: :reactionable

  validates :title, presence: true
  validates :user_id, presence: true
end
