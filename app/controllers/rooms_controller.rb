# チャットルームのコントローラーファイル
class RoomsController < ApplicationController

  def index
  end
  
  def new
    @room = Room.new
    # チャットルーム新規作成「new」アクションの定義。form_withに渡す引数として、値の空のRoomインスタンスを＠roomに代入
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
    # 保存が上手く行ったかどうかの処理の分岐。上手くいかなかった場合は「render」でrooms/new.html.erbにページを戻す。
  end

  def destroy
    # 削除するだけなのでビューの表示は必要はない。
    room = Room.find(params[:id])
    # 削除したいチャットルームの情報の取得
    room.destroy
    # 変数としてroomを定義し、destoryメソッドを使用する
    redirect_to root_path
    # destoryメソッドが実行されたらroot(roomのindex)にリダイレクトの記述
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids:[])
    # 配列い対して保存の許可をしたい場合は、キーの名称と関連づけて、バリューの中は「[]」と記述する。
  end


end
