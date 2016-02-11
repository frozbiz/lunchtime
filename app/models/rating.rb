class Rating < ActiveRecord::Base
    belongs_to :user
    belongs_to :shop

    after_save :recalculate_ratings

    def recalculate_ratings
        avg_rating = shop.ratings.average(:rating)
        shop.update_attributes(:avg_rating => avg_rating)
    end
end
