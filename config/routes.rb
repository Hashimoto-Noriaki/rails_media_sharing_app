Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
    # 他のDeviseコントローラがあればここに追加する場合もあります
  }

  resources :users

  # ルートパスを設定する
  root to: 'users#index'

  # 他のカスタムルートもここに追加します
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create', as: 'signup_post'
end
