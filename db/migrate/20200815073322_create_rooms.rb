class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      # カラムを追加できる。SQLは実行すると値を保存できてしまうので、そのために「null: false」で空で登録出来ないようにする
      t.timestamps
    end
  end
end
