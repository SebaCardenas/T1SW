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

    def search  
        if params[:search].blank?  
            redirect_to(root_path, alert: "Empty field!") and return  
        else  
            @parameter = params[:search].downcase  
            url = 'https://swapi.co/api/'
            response = RestClient.get(url)
            json2 = JSON.parse(response)
            @object2 = json2
            @verificador = false
    
            @object2.each do |tipo|
                url = tipo[1]
                response = RestClient.get(url)
                json3 = JSON.parse(response)
                @object3 = json3["results"]
                @object3.each do |nombre|
                    if url == 'https://swapi.co/api/films/'
                        if nombre['title'].downcase == @parameter
                        @verificador = true
                        redirect_to pelicula_index_path(:p_id => nombre['url'])
                        end
                    elsif url == 'https://swapi.co/api/people/'
                        if nombre['name'].downcase == @parameter
                        @verificador = true
                        redirect_to character_index_path(:pl_id => nombre['url'])
                        end
                    elsif url == 'https://swapi.co/api/planets/'
                        if nombre['name'].downcase == @parameter
                        @verificador = true
                        redirect_to planet_index_path(:pl_id => nombre['url'])
                        end
                    elsif url == 'https://swapi.co/api/starships/'
                        if nombre['name'].downcase == @parameter
                        @verificador = true
                        redirect_to nave_index_path(:pl_id => nombre['url'])
                        end
                    end
                end 
            end
            if @verificador == false
                redirect_to search_character_path
            end 
        end
    end
end
