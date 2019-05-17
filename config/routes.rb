Rails.application.routes.draw do
  root "static_page#home"

  resources :billboards do
    resources :songs 
  end

  resources :artists do 
    resources :songs
  end 
end
