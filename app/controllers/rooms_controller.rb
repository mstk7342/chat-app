# チャットルームのコントローラーファイル
class RoomsController < ApplicationController
  def index
    @room = Room.new
    # チャットルーム新規作成「new」アクションの定義。form_withに渡す引数として、値の空のRoomインスタンスを＠roomに代入
  end

  
end
