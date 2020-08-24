require 'rails_helper'

RSpec.describe "メッセージ投稿機能", type: :system do
  before do
    # 中間テーブルを作成して、usersテーブルとroomsテーブルのレコードを作成する
    @room_user = FactoryBot.create(:room_user)
  end

  # room.userrbに定義した FactoryBotのassociationメソッドによって上記の書き方ができる。associationを利用すると、associationで定義したインスタンスも一緒に生成される。

  context '投稿に失敗したとき' do
    it '送る値が空の為、メッセージの送信に失敗すること' do
      # サインインする
      sign_in(@room_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)

      # DBに保存されていないことを確認する
      expect{
        find('input[name="commit"]').click
      }.not_to change { Message.count }

      # メッセージを送信するためにfindメソッドを使用して、送信ボタンの「input[name="commit"]」要素を取得してクリックする。しかし、何も入力えお行っていないので、データベースのmesseageモデルのカウントが増えていないことを確認している。

      # 元のページに戻ってくることを確認する
      expect(current_path).to eq room_messages_path(@room_user.room)
      # 送信が失敗した場合は元のページ、メッセージ一覧画面に遷移していることを確認している。
    end
  end

  context '投稿に成功したとき' do
    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている' do
      # サインインする
      sign_in(@room_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)

      # 値をテキストフォームに入力する
      post = "テスト"
      fill_in 'message_content', with: post
      # 送信した値がDBに保存されていることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Message.count }.by(1)
      # 投稿一覧画面に遷移していることを確認する
      expect(current_path).to eq room_messages_path(@room_user.room)
      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(post)
    end
     it '画像の投稿に成功すると、投稿一覧に遷移して、投稿した画像が表示されている' do
      # サインインする
      sign_in(@room_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')  #代入
      # Rails.root.join・・・railsアプリケーションのトップ階層のディレクトリまでの絶対パスの取得ができる。
      # パスの情報に対してjoinメソッドを利用することで、引数として渡した文字列でのパス情報をRails.joinのパス情報に引っ付けることができる。

      # 画像選択フォームに画像を添付する
      attach_file('message[image]', image_path, make_visible: true )
      # image_pathは代入されている。

      # 送信した値がDBに保存されていることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Message.count }.by(1)
      # 投稿一覧画面に遷移していることを確認する
      expect(current_path).to eq room_messages_path(@room_user.room)
      # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector("img")
      # have_selector・・・一覧表示されているかの確認する事
    end
    it 'テキストと画像の投稿に成功すること' do
      # サインインする
      sign_in(@room_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')

      # 画像選択フォームに画像を添付する
      attach_file('message[image]', image_path, make_visible: true )
      # 値をテキストフォームに入力する
      post = "テスト"
      fill_in 'message_content', with: post
      # 送信した値がDBに保存されていることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change{Message.count}.by(1)
      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(post)
      # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector("img")
    end
  end
end


