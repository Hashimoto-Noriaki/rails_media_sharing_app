Rails.application.routes.draw do
  resources :articles
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users

  # ルートパスを設定する
  root to: 'users#index'

  # 他のカスタムルートもここに追加します
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create', as: 'signup_post'

  # # 記事関連のカスタムルートを追加
  # get 'articles/new', to: 'articles#new', as: 'new_article'
  # post 'articles', to: 'articles#create', as: 'create_article'
  # delete 'articles/:id', to: 'articles#destroy', as: 'delete_article'
end
