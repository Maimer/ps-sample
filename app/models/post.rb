class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :subject, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :group_id, presence: true
end
