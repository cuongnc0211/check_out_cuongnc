require "promotion"

class BillPromotion < Promotion
  def calculate_discount(checkout)
    discount = 0
    base_total_amount = base_total_amount(checkout)

    discount = (base_total_amount * self.discount_percent) if base_total_amount >= self.requirement_amount
    discount
  end

  private

  def base_total_amount(checkout)
    base_amount = 0
    checkout.items.each do |item|
      base_amount += (item.price - item.discount_amount)
    end
    base_amount
  end
end