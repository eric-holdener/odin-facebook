class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :reactions, as: :reactionable

  has_many :subcomments, class_name: "Comment", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Comment", optional: true

  has_many_attached :pictures, dependent: :destroy
  validates :pictures, content_type: %i[png jpg jpeg]

  validates :content, presence: true

  def comment_age
    return ((Time.zone.now - created_at.to_time) / 1.year.seconds).floor
  end
end
