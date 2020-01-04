class Promotion
  attr_accessor :id, :type, :requirement_amount, :target_type, :target_id, :discount_percent

  def initialize(id, type, requirement_amount, target_type, target_id, discount_percent)
    @id                 = id
    @type               = type
    @requirement_amount = requirement_amount
    @target_type        = target_type
    @target_id          = target_id
    @discount_percent   = discount_percent
  end
end
