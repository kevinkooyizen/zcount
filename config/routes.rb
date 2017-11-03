Rails.application.routes.draw do
  root 'static#home'
  resources :incomes
  resources :expenses
end
