Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
  get "impressum", to: "pages#impressum"
  get "datenschutz", to: "pages#datenschutz"
  resource :contact, only: [ :create ]
end
