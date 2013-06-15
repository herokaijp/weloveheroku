WeLoveHeroku::Application.routes.draw do
  resources :sites, only: [:new, :create, :index, :show]
  root to: 'sites#index'
end
