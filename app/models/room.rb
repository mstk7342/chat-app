# roomモデルファイル
class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages

  validates :name, presence: true
  # validates :カラム名, 検証ルール（シンボル指定「:」）
  # ルーム名が存在(presence)している場合のみ作成可能(ture)という意味
end
