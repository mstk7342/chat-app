class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|  # room_userは中間テーブル
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      # reference「参照」。参照する役割を果たすのが、foreign_key: true
      t.timestamps
    end
  end
end
