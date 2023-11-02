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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :admin do
   get "/" => "homes#top"
  end
  
  scope module: :public do
   root "homes#top"
   get "about" => "homes#about"
  end
  
  
end
