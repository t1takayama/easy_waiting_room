Rails.application.routes.draw do
  namespace :admin do
    get  '/',                       to: 'pages#index'
    get  '/acceptable_number/edit', to: 'acceptable_numbers#edit', as: 'edit_acceptable_number'
    post '/acceptable_number',      to: 'acceptable_numbers#update'
  end

  match '/',  to: 'rooms#handler', via: :all
  match '/*', to: 'rooms#handler', via: :all
end
