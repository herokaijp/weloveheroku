WeLoveHeroku::Application.routes.draw do
  resources :sites, only: [:new, :create, :index, :show]
end
