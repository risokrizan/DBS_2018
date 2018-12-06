Rails.application.routes.draw do
  resources :announcements
  resources :computers
  root to: 'announcements#index'

  resources :pools
  resources :transactions
  resources :banks
  resources :accounts
  resources :income_by_custommers
  resources :mining_histories
  resources :customers

  get '/city_report', to: 'report#report_city'
  get '/city_report2', to: 'report#report_city2'
  get "report" => "report#index", as: "report"
  get '/customer_pc_report', to: 'report#customer_pc'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
