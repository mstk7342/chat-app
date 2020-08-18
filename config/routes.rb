# ルーティングの設定
Rails.application.routes.draw do
  devise_for :users
  # get 'messages/index'
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "rooms#index"
  # messages_controllerのindexアクション
  resources :users, only: [:edit, :update]  #ユーザー編集に必要なルーティングは、edit「編集」,update「更新」
  resources :rooms, only: [:new, :create] do #新規チャットルーム作成ページは、new「生成」、create「保存」
    resources :messages, only: [:create, :index]
  end
  # メッセージ投稿の際にどのチャットルームで投稿されたメッセージなのかをパスから判断可能にしている。親が「room」、子が「messages」
  # resoureces :コントローラー名, only: [アクション名] do~endでルーティングのネストを記述している。
  # ネストとは、親子関係を示す「入れ子構造」とのこと。コントローラーへのルーティングの記述の中に、別のコントローラーへのルーティングの記述を指している。
end
