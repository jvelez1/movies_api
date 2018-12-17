Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    resources :movies, only: %i[index show]
    resources :seasons, only: %i[index show]
    resources :medias, only: %i[index]
    resources :user, except: %i[index show new edit update destroy create] do
      resources :libraries, shallow: true, only: %i[index]
      resources :purchases, only: %i[create]
    end
  end
end
