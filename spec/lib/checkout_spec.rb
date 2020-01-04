require "spec_helper"

RSpec.describe "Checkout" do
  [
    [1, "001", "Lavender heart", 9.25],
    [2, "002", "Personalised cufflinks", 45.00],
    [3, "003", "Kids T-shirt", 19.95]
  ].each do |item|
    let("product_#{item[0]}") { Product.new *item }
  end

  let(:product_promotion) { ProductPromotion.new 2, "item", 2, "Product", 1, (9.25 - 8.5)/9.25 }
  let(:bill_promotion) { BillPromotion.new 1, "bill", 60, "", "", 0.1 }
  let(:promotional_rules) { [product_promotion, bill_promotion] }

  describe "#scan" do
    let(:checkout) { Checkout.new promotional_rules }

    it "return correct total amount before discount" do
      checkout.scan(product_1)
      checkout.scan(product_2)

      expect(checkout.items.count).to eq(2)
      expect(checkout.total_before_discount).to eq(product_1.price + product_2.price)
    end
  end

  describe "#total" do
    context "Basket: 001,002,003" do
      let(:checkout) { Checkout.new promotional_rules }

      it "return correct total 66.78" do
        checkout.scan(product_1)
        checkout.scan(product_2)
        checkout.scan(product_3)

        expect(checkout.total).to eq(66.78)
      end
    end

    context "Basket: 001,003,001" do
      let(:checkout) { Checkout.new promotional_rules }

      it "return correct total 36.95" do
        checkout.scan(product_1)
        checkout.scan(product_3)
        checkout.scan(product_1)

        expect(checkout.total).to eq(36.95)
      end
    end

    context "Basket: 001,002,001,003" do
      let(:checkout) { Checkout.new promotional_rules }

      it "return correct total 73.76" do
        checkout.scan(product_1)
        checkout.scan(product_2)
        checkout.scan(product_1)
        checkout.scan(product_3)

        expect(checkout.total).to eq(73.76)
      end
    end
  end
end