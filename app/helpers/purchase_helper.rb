module PurchaseHelper
  def currency_to_number currency
    currency.to_s.gsub(/[N,]/,'').to_f
  end

  def change_card_ownership (unsold)

  end
end
