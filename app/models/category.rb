class Category < ApplicationRecord
  has_many :posts

  validates :title, presence: true, length: { in: 3..50 }, uniqueness: { case_sensitive: false }
end
