class HomeController < ApplicationController

def index
  @outings = Outing.where("departure > ?", Time.now).limit(10).all
end

end
