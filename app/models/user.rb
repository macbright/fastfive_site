class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  # attr_accessor :avatar_file_name
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :card_types, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_one  :wallet, dependent: :destroy
  has_many :purchases, dependent: :destroy

  def name(user)
    "#{user.first_name.upcase}  #{user.last_name.upcase}"
  end
  
end
