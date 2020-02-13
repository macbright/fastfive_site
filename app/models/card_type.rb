class CardType < ApplicationRecord
  has_many :cards, class_name: 'Card', foreign_key: 'cardKind'
  belongs_to :user

  validates :name, presence: true, length: { in: 3..50 }, uniqueness: { case_sensitive: false }
end
