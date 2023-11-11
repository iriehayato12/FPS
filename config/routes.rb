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
   resources :posts, only: [:index, :show, :destroy] do
     resources :post_comments, only: [:show, :destroy]
   end
   get "search" => "searches#search"
   resources :categories, only: [:index, :create, :edit, :destroy, :update, :destroy]
  end
  
  scope module: :public do
   root "homes#top"
   get "about" => "homes#about"
   #退会処理
   patch "users/withdraw" => "users#withdraw"
   resources :users, only: [:show, :edit, :update] do
     member do
      get :favorites 
     end
    end
   resources :posts, only: [:new, :index, :show, :create, :destroy, :update, :edit] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
   end
   get "search" => "posts#search_name"
   get "/category/search" => "searches#search_category"
   #通知機能
   resources :notifications, only: [:index, :destroy]
  end
  
   
end
