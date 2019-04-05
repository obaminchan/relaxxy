class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)   #多分ここが原因・・・かcomment_id がないから

      if @post.save
      redirect_to posts_path, success: "お店の登録に成功しました"   #HTTPリクエスト（ここではGETメソッド）をサーバーに送りそこから帰ってくるHTMLをユーザーに表示（Posts.index.html)
      else
      flash.now[:danger] = "お店の登録に失敗しました"
      render :new                                                   #Action内で呼び出すHTML,Viewを指定するメソッド
      end
    end

    private
     def post_params
       params.require(:post).permit(:image, :title, :content)
     end
end
