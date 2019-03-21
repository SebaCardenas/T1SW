Rails.application.routes.draw do
  resources :welcome, :planet, :character, :nave
  root 'welcome#index'
  root 'welcome#especificacion'
  root 'planet#index'
  root 'character#index'
  root 'nave#index'
  
end
