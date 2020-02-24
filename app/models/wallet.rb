class Wallet < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :payments

  def fund_wallet(amount)
    self.balance += (amount / 100)
  end
end
