require 'httparty'

class Recipe
    include HTTParty
    
    base_uri 'http://food2fork.com/api'
    default_params key: ENV["FOOD2FORK_KEY"]
    format :json
    
    def self.for keyword
        # the HTTP GET request must have the q=keyword query argument and query "/search" route
        get("/search", query: {q: keyword})["recipes"]
    end
    
end