class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize (discount=0)
        @total=0
        @discount=discount
        @items=[]
        @last_transaction=0
    end

    def add_item title, price, quantity=1
        @last_transaction = price * quantity
        quantity.times do 
            @items= items << title
        end
        @total=self.total + price * quantity
    end

    def apply_discount
        if self.discount != 0
            @total=self.total * (100 - self.discount)/100
            "After the discount, the total comes to $#{total}."
        elsif self.discount == 0
            "There is no discount to apply."
        end
    end

    def items
        @items 
    end

    def void_last_transaction
        @total = self.total - self.last_transaction
    end

end
