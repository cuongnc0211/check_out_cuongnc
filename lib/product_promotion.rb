require "promotion"

class ProductPromotion < Promotion
  def calculate_discount(checkout)
    discount = 0
    return discount if checkout.items.group_by(&:id)[self.target_id].count < self.requirement_amount

    checkout.items.each do |item|
      if item.id == self.target_id && item.class.to_s == self.target_type
        item_discount = item.price * self.discount_percent

        discount += item_discount
        item.discount_amount = item_discount
      end
    end

    discount
  end
end