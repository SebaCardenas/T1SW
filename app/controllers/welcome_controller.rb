class WelcomeController < ApplicationController
    def index
        url = 'https://swapi.co/api/films'
        response = RestClient.get(url)
        json = JSON.parse(response)
        @object = json["results"]
        end
      def show
    
        if params[:p_id]
          @pp_id = params[:p_id]
          url2 = @pp_id 
          response2 = RestClient.get(url2)
          json2 = JSON.parse(response2)
          @new_item = json2
        end
        render template: "welcome/especificacion"
    
      end
  
end
