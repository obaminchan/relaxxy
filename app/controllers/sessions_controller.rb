class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])    # 該当のメアドを持つユーザーが存在する。かつuserのパスワードが正しい
      log_in user
      redirect_to root_path, success: "ログインに成功しました"
    else
     flash.now[:danger] = 'ログインに失敗しました'
     render :new
    end
  end

  private
  def log_in user                  # ここでlog_inメソッドでsession[:user_id]にログイン情報を保存している
    session[:user_id] = user.id    # Sessionメソッドはrailsにもともと定義されているメソッド。暗号化して保存するためのメソッド
  end
end
