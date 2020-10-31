class Task < ApplicationRecord
  has_one_attached :eyecatch
  has_many :comments
  belongs_to :user
end
