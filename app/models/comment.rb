class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_many :comment_images
  accepts_nested_attributes_for :comment_images

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true

end
