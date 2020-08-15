# ルーティングの設定
Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "messages#index"
  # messages_controllerのindexアクション
  resources :users, only: [:edit, :update]  #ユーザー編集に必要なルーティングは、edit「編集」,update「更新」
  resources :rooms, only: [:new, :create]  #新規チャットルーム作成ページは、new「生成」、create「保存」
end
