Rails.application.routes.draw do
  root "billboard#index"

  resources :billboards do
    resources :songs 
  end

  resources :artists do 
    resources :songs
  end 
end
