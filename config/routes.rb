Rails.application.routes.draw do
  root to: 'welcome#index'

  get  'getting_started', to: 'getting_started#new'
  post 'getting_started', to: 'getting_started#create'
end
