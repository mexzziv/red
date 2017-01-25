Rails.application.routes.draw do
  devise_for :users, controllers:{
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  post "/custom_sign_up", to: "users/omniauth_callbacks#custom_sign_up"

  authenticated :user do
    root 'main#home'
  end

  unauthenticated :user do
    root 'main#unregistered'
  end

  #Mandar una peticion a facebook
  #facebook retornaa nuestra app mediante callback_url
  #Procesar la informacio de facebook
  #Checar quees lo que va a hacer crear o loggear

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
