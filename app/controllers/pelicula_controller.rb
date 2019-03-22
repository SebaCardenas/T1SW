class PeliculaController < ApplicationController
    def index
        if params[:p_id]
            @pp_id = params[:p_id]
            url2 = @pp_id 
            response2 = RestClient.get(url2)
            json2 = JSON.parse(response2)
            @new_item = json2
        end
    end
end
