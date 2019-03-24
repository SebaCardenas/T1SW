class WelcomeController < ApplicationController

  def index
    url = 'https://swapi.co/api/films'
    response = RestClient.get(url)
    json = JSON.parse(response)
    @object = json["results"]
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

      @object2.each do |tipo|
        url = tipo[1]
        response = RestClient.get(url)
        json3 = JSON.parse(response)
        @object3 = json3["results"]
        @object3.each do |nombre|
        if url == 'https://swapi.co/api/films/'
          if nombre['title'].downcase == @parameter
            redirect_to pelicula_index_path(:p_id => nombre['url'])
          end
        elsif url == 'https://swapi.co/api/people/'
          if nombre['name'].downcase == @parameter
            redirect_to character_index_path(:pl_id => nombre['url'])
          end
        elsif url == 'https://swapi.co/api/planets/'
          if nombre['name'].downcase == @parameter
            redirect_to planet_index_path(:pl_id => nombre['url'])
          end
        elsif url == 'https://swapi.co/api/starships/'
          if nombre['name'].downcase == @parameter
            redirect_to nave_index_path(:pl_id => nombre['url'])
          end
        end
        end 
      end
    end  
  end
  

end

