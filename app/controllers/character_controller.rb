class CharacterController < ApplicationController
    def index
        if params[:pl_id]
            @pp_id = params[:pl_id]
            url2 = @pp_id 
            response2 = RestClient.get(url2)
            json2 = JSON.parse(response2)
            @new_item2 = json2
        end
    end
end