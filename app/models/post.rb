class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: { in: 3..50}, uniqueness: { case_sensitive: false }
  validates :category_id, presence: true 
  validates :body, presence: true, length: { in: 10..8000}

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
