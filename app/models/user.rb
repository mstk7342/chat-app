# userのモデルファイル
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  # 空の場合はDBに保存しないというバリデーションの設定。nameを空欄にして登録しようとする場合、エラーが発生する。

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  # １人のユーザーは複数のメッセージを送信できる。　１対多の関係
end
