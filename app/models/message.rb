class Message < ApplicationRecord
  # アソシエーションの設定（モデルを利用したテーブル同士の関係を結ぶこと）
  belongs_to :room
  # １つのチャットルームに、メッセージは複数存在する。１対多の関係
  belongs_to :user
  # １人のユーザーは、複数のメッセージを送信できる。
  has_one_attached :image
  # Messageテーブルの各レコードと画像ファイルを管理するimageカラムの紐付けができる。Messageテーブルにカラムを追加する必要はない。
  validates :content, presence: true
  # 「content」カラムに、presence: tureを設けることで、空の場合DBに保存しないバリデーション設定をしている。
end
