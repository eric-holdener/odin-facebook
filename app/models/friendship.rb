class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  scope :accepted_friend, -> { where('status == ?', 1) }
end
