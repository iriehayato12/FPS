Rails.application.routes.draw do
  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
      sessions: "admin/sessions"
  }
  
  #ユーザー用
  devise_for :users, skip: [:password], controllers: {
      registrations: "public/registrations",
      sessions: "public/sessions"
  }
  #ゲストログイン用
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :admin do
   get "/" => "homes#top"
   resources :users, only: [:index, :show, :edit, :update]
   resources :posts, only: [:index, :show, :destroy] 
   get "search" => "searches#search"
   resources :categories, only: [:index, :create, :edit, :destroy]
  end
  
  scope module: :public do
   root "homes#top"
   get "about" => "homes#about"
   resources :users, only: [:show, :edit, :update]
   #退会処理関係
   get "users/confirm_withdraw" => "users#confirm_withdraw"
   patch "users/withdraw" => "users#withdraw"
   
   resources :posts, only: [:new, :index, :show, :create, :destroy, :update, :edit] do
    get :search, on: :collection
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
   end
  end
  
 end
   

