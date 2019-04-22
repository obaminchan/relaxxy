class UsersController < ApplicationController
  def new
    @user = User.new    # 引数なしでオブジェクトを作ると、データの入ってないUserオブジェクトができる
  end                   # 枠だけで中身は空っぽ！ パラメータ（カラム）が全て空っぽということ

  def create
    @user = User.new(user_params)                      #1.formで送られてきたデータを取得 2.その情報を持ったuserオブジェクトを作る 3.保存処理
    if @user.save
    redirect_to root_path, success: "新規登録に成功しました"  #redirect_toの場合、flashを省いて引数にsuccessというキーを渡すだけでフラッシュメッセージの表示が可能
    else
    flash.now[:danger] = "新規登録に失敗しました"      #1回限りのインスタントメッセージを表示する仕組みをflashという
    render :new                                        # flash.nowは現在のリクエストまで表示される/ flashは次のリクエストまでで長すぎるから
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
