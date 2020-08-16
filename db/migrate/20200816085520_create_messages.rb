class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      # 外部制約キーでidで判別できるレコードの関連付けを行う。
      t.timestamps
    end
  end
end
