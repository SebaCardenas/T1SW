Rails.application.routes.draw do
  resources :welcome
  root 'welcome#index'
  root 'welcome#especificacion'
end
