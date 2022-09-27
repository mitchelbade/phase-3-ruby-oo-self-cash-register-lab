require 'pry'

class CashRegister
    attr_accessor :total, :discount, :recent, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.recent = price * quantity
        self.total += self.recent
        quantity.times do 
            @items << title
        end
    end

    def apply_discount
        if self.discount != 0
            percent = (100.0 - self.discount.to_f) / 100
            self.total = (self.total * percent).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items(one = "", two = "", three = "")
        if one.empty? == false && two.empty? == false
            @items
        else one.empty? == false && two.empty? == false && three.empty? == false
            @items
        end
    end

    def void_last_transaction
        self.total -= self.recent
    end
end