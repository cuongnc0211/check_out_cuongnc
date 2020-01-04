class Product
  attr_accessor :id, :code, :name, :price, :discount_amount

  def initialize(id, code, name, price)
    @id    = id
    @code  = code
    @name  = name
    @price = price
    @discount_amount = 0
  end
end
