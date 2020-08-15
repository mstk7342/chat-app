class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # ログインしていないユーザーをサインアップの画面に促すことが可能
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) 
    #  deviseでいうparams[ストロングパラメーター]のようなメソッドで「特定のカラムを許容する」メソッド
    #   permit・・・。取得したいキーを指定できる。指定したキーと値のセットのみの取得
    # :sign_up・・・サインアップ（新規登録）の処理を行う時に使う
  end


end
