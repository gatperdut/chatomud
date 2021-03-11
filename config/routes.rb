# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  mount_devise_token_auth_for "Player", at: "authentication", controllers: {
    registrations: "overrides/registrations",
    passwords: "overrides/passwords",
    confirmations: "overrides/confirmations",
    unlocks: "overrides/unlocks",
    sessions: "overrides/sessions",
    token_validations: "overrides/token_validations"
  }

  get "/system/info", defaults: { format: :json }

  # resources :players, only: [:show, :create, :destroy], defaults: { format: :json }
  get  "/players", to: "players#index", defaults: { format: :json }
  get  "/players/:id", to: "players#show", defaults: { format: :json }

  get  "/characters/yours", defaults: { format: :json }
  get  "/characters/previous", defaults: { format: :json }
  resources :characters, defaults: { format: :json }

  resources :superareas, defaults: { format: :json }

  resources :areas, defaults: { format: :json }
  get "/areas/:id/rooms", to: "areas#rooms", defaults: { format: :json }

  get "/rooms/search", to: "rooms#search", defaults: { format: :json }
  resources :rooms, defaults: { format: :json }

  resources :doors, defaults: { format: :json }

  resources :items, only: [:show, :index, :create, :destroy], defaults: { format: :json }

  get "/item_templates/code/:code", to: "item_templates#show_by_code", defaults: { format: :json }
  get "/item_templates/search", to: "item_templates#search", defaults: { format: :json }
  resources :item_templates, defaults: { format: :json }

  resources :crafts, defaults: { format: :json }

  resources :announcements, only: [:index], defaults: { format: :json }

  get "/constants/weapons",          defaults: { format: :json }
  get "/constants/armor",            defaults: { format: :json }
  get "/constants/fluids",           defaults: { format: :json }
  get "/constants/ingredients",      defaults: { format: :json }
  get "/constants/skills",           defaults: { format: :json }
  get "/constants/skill_categories", defaults: { format: :json }
  get "/constants/attributes",       defaults: { format: :json }
end
