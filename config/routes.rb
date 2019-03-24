Rails.application.routes.draw do
  resources :welcome, :planet, :character, :nave, :pelicula
  root 'welcome#index'
  root 'pelicula#index'
  root 'planet#index'
  root 'character#index'
  root 'nave#index'

  get '/search' => 'welcome#search', :as => 'search_welcome'
  get '/search' => 'pelicula#search', :as => 'search_pelicula'
  get '/search' => 'planet#search', :as => 'search_planet'
  get '/search' => 'character#search', :as => 'search_character'
  get '/search' => 'nave#search', :as => 'search_nave'

  
end
