# roomモデルファイル
class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  # チャットルームに紐付いているユーザー情報を削除の設定の記述。チャットルームの情報は全て削除される。

  validates :name, presence: true
  # validates :カラム名, 検証ルール（シンボル指定「:」）
  # ルーム名が存在(presence)している場合のみ作成可能(ture)という意味
end
