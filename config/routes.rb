# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  mount_devise_token_auth_for 'Player', at: 'authentication', controllers: {
    registrations: 'overrides/registrations',
  }
end
