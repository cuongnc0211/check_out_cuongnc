class Checkout
  attr_accessor :promotion_rules, :items, :total_before_discount

  def initialize(promotion_rules)
    @promotion_rules = promotion_rules
    self.items = []
    self.total_before_discount = 0
  end

  def scan(item)
    self.items << item
    self.total_before_discount += item.price
  end

  def total
    (self.total_before_discount - total_discount_amount).round(2)
  end

  private

  def total_discount_amount
    total_discount = 0
    promotion_rules.each do |promotion|
      total_discount += promotion.calculate_discount(self)
    end
    total_discount
  end
end