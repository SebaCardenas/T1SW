Rails.application.routes.draw do
  resources :welcome, :planet, :character, :nave, :pelicula
  root 'welcome#index'
  root 'pelicula#index'
  root 'planet#index'
  root 'character#index'
  root 'nave#index'
  
end
