class UsersController < ApplicationController

  def edit
    
  end

  def update
    # 保存できた場合とできなかった場合で条件分岐
    if current_user.update(user_params)
    # ログインしているユーザーの情報の更新
      redirect_to root_path
      # root・・・チャット画面
      # editアクションを指定しているため、ビューが表示される。
    else
      render :edit
    end
  end

  private  #クラス外から呼び出すことができないメソッド。

  def user_params
    # ストロングパラメーターを使用して、user_paramsを定義している。
    params.require(:user).permit(:name, :email)
    # :name,:emailのキーの編集を許可
  end

end
