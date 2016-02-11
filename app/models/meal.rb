class Meal < ActiveRecord::Base
    belongs_to :user
    belongs_to :shop

    after_save :recalculate_prices

    def recalculate_prices
        avg_price = shop.meals.average(:price)
        shop.update_attributes(:avg_price => avg_price)
    end
end
