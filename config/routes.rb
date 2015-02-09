Rails.application.routes.draw do
  root to: 'welcome#index'

  get  'getting_started', to: 'getting_started#new'
  post 'getting_started', to: 'getting_started#create'

  resources :sessions, only: %i(create)
  get    'login',  to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'

  scope 'wf' do
    # XXX ひとまず
    root to: 'users#index', as: 'wf_root'

    resources :users, only: %i(index create)
  end
end
