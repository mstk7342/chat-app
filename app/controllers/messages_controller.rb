class MessagesController < ApplicationController
  def index
    @message = Message.new
    # Messageモデルのインスタンス情報の代入
    @room = Room.find(params[:room_id])
    # paramsに含まれているroom.idの代入
    # ルーティングをネストしている為、パスにroom_idが含まれている為、paramsの中にroom_idという値が含まれている。params[:room_id]を記述することでroom_idを取得できる。
    @messages = @room.messages.includes(:user)
    # @messageとチャットルームに紐付いてる全てのメッセージ（@room_messages)
    # 一覧画面で表示するメッセージ情報に、ユーザー情報も紐付いて表示される。
  end


  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    # チャットルームに紐付いたメッセージのインスタンスの生成
    @message.save
    # ＠messagrに代入し、saveメソッドでメッセージの内容をmessageテーブルに保存をする
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save #メッセージの保存
      redirect_to room_messages_path(@room)
      # 参加しているチャットルームに投稿したメッセージの一覧画面表示の記述
    else
      @messages = @room.messeages.includes(:user)
      render :index
      # トップページ（indexアクションが実行）表示をされ同じページに戻るという記述
    end
  end




  private
  # message_paramsを定義して、メッセージの内容(content)をmessagesテーブルへ保存できるようにする。

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
    # ログインしているユーザーのidと紐付いてる、メッセージ(content)を受け取る許可を記述している。
  end

end
