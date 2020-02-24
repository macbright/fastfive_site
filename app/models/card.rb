class Card < ApplicationRecord
  belongs_to :card_type, class_name: 'CardType', foreign_key: 'cardKind' 
  belongs_to :user

  validates :cardPin, presence: true, uniqueness: { case_sensitive: false }
  # validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :cardSerialNum, presence: true, uniqueness: { case_sensitive: false }
  validates :cardPrice, presence: true
  validates :cardKind, presence: true
end




