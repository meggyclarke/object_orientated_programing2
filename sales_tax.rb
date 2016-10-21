# class Product
#
#     attr_accessor :name, :title, :price
#
#     def initialize(name, title, price)
#         @name = name
#         @title = title
#         @price = price
#         @tax_value = 0
#     end
#
#     # def product_total_price
#     #     @product_total_price = @price * new_tax_value
#     # end
#     #
#     # def bill_total
#     #     @bill_total = @product_total_price.each do |owing|
#     #     owing = (owing += product_total_price)
#     #     end
#     #end
# end

class Tax
    attr_accessor :name, :title, :price

    def initialize(name, title, price)
        @name = name
        @title = title
        @price = price
        @tax_value = 0
    end

    def tax_free_products
            #puts "this tax free "
        if @name == "medicine" || @name =="book" || @name =="food"
            #puts @tax_value * @price
            @tax_value = 0
        else
            #puts 0.10 * @price
            @tax_value = 0.10
        end
    end

    def new_tax_value
        if @name == "imported"
            @tax_value = ((tax_free_products + 0.05)* @price).round(2)
            #puts @tax_value
        else
            @tax_value = (tax_free_products * @price).round(2)
            #puts @tax_value
        end
    end
    def product_total_price
        @product_total_price = @price + new_tax_value
    end
end
class Shopping_cart
    attr_accessor :shopping_bag

    def initialize
        @shopping_bag = []
    end
    def add_product_to_cart(product)
        @shopping_bag << product
    end

end

book = Tax.new("book", "Harry Potter", 20) #tax 0 total 20
french_wine = Tax.new("imported", "Chablis_Wine", 60) # tax 9 total 69
shirt = Tax.new("product", "Rolling_Stones_Concert_Tee", 25) # tax 2.50 total 27.50
chocolate = Tax.new("imported", "Belguim_Chocolate", 15) #tax 2.25 total 17.25
advil = Tax.new("medicine", "Advil", 10) #tax 0 total 10
purse = Tax.new("purse", "Laptop Bag", 35) #3.5 tax total 38.5

shopping_cart = Shopping_cart.new
shopping_cart.add_product_to_cart(book)
shopping_cart.add_product_to_cart(french_wine)
shopping_cart.add_product_to_cart(shirt)
shopping_cart.add_product_to_cart(chocolate)
shopping_cart.add_product_to_cart(advil)
shopping_cart.add_product_to_cart(purse)


 shopping_cart.shopping_bag.each do | buying|
    puts "#{buying.title} is #{buying.price} Tax amount :#{buying.new_tax_value}"
    end
# puts french_wine "#{@title} is #{@price} Tax amount :#{@tax_value}"
# puts shirt "#{@title} is #{@price} Tax amount :#{@tax_value}"
# puts chocolate "#{@title} is #{@price} Tax amount :#{@tax_value}"
# puts advil "#{@title} is #{@price} Tax amount :#{@tax_value}"
# puts purse "#{@title} is #{@price} Tax amount :#{@tax_value}"


#total should be 182.25
sum = 0
shopping_cart.shopping_bag.each {|random| sum += random.product_total_price.round(2)}


puts "Your receipt total is #{sum}. Way to go big spender!"
