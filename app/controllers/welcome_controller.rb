class WelcomeController < ApplicationController
   def index
    url = 'https://swapi.co/api/films'
    response = RestClient.get(url)
    json = JSON.parse(response)
    @object = json["results"]
   end
   def show
    render template: "welcome/especificacion"
  end
  
end
