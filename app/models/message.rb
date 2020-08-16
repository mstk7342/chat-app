class Message < ApplicationRecord
  belongs_to :room
  # １つのチャットルームに、メッセージは複数存在する。１対多の関係
  belongs_to :user
  # １人のユーザーは、複数のメッセージを送信できる。
end
