class User < ApplicationRecord
  has_and_belongs_to_many :groups
  has_many :posts

  devise :database_authenticatable, :registerable, :rememberable

  validates :name, presence: true, on: :create
end
