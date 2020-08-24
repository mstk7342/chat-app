require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  it 'ログインしていない状態でトップページにアクセスした場合、サインインページに移動する' do
    # トップページに遷移する
    visit root_path
    # visit 〇〇_path・・・〇〇のページへ移動することを表現できる。

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path
    # 「current.path」は今アクセスしているページの情報が含まれている。
    # 現在のページ「current.path」・サインインページ「new_user_session_path」
  end

  it 'ログインに成功し、トップページに遷移する' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    # データベースにcreateメソッドでユーザーをテスト用のDBに保存する。保存したユーザーで、この後ログインを行う。

    # サインインページへ移動する
    visit new_user_session_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path

    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    # 「メールアドレス」、「パスワード」をfill_inメソッドでフォームへの入力が可能になる。

    # ログインボタンをクリックする
    click_on ("Log in")

    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path
    # expectメソッドを用いて、ログインページ（current_path）から、トップページ（root_path）に遷移していることを確認する記述

  end
  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する

    # トップページに遷移する

    # ログインしていない場合、サインインページに遷移していることを確認する

    # 誤ったユーザー情報を入力する

    # ログインボタンをクリックする

    # サインインページに戻ってきていることを確認する

  end
end
