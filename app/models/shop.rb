class Shop < ActiveRecord::Base
    has_many :meals
    has_many :ratings
    belongs_to :user
    belongs_to :office

    before_save :attempt_to_calculate_distance

    def attempt_to_calculate_distance
        uri = "https://maps.googleapis.com/maps/api/distancematrix/json"
        office = Office.find(office_id)
        office_address = Rack::Utils.escape(office.address)
        shop_address = Rack::Utils.escape(address)
        params = {:origins => office_address, :destinations => shop_address, :mode => 'walking', :units => 'imperial'}
        result_json = HTTP.get(uri, :params => params).to_s
        result = JSON.parse result_json
        if result["status"] == "OK"
            element = result["rows"][0]["elements"][0]
            if element["status"] == "OK"
                self.distance_meters = element["distance"]["value"]
                self.distance_text = element["distance"]["text"]
                self.time_seconds = element["duration"]["value"]
                self.time_text = element["duration"]["text"]
            end
        end
    end
end
