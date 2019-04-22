class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end


  def new
    @comment = Comment.new
    @post_id = params[:post_id]  #ここで「どの投稿に対して口コミをするのか」という情報 post_idをparamsで受け取り格納
  end

  def create
    comment = Comment.new(comment_params)
    comment.post_id = params[:post_id] #hiddenで隠されたpost_id が送信時にパラメーターで飛ばされparamsで受け取りcreateアクションが動く！
    if comment.save
       redirect_to comments_path, success: '口コミを投稿しました'
    else
      flash.now[:danger] = '口コミを投稿できませんでした'
      render :new
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comments_path
  end

  def edit                                    # 新規画面からのデータ送信はPostメソッド、編集画面からのデータ送信はPatchメソッド
    comment = Comment.find_by(post_id:params[:post_id])
  end

  def update
    comment = Comment.find_by(post_id:params[:post_id])
    comment.update(comment_params)
    redirect_to comments_path
  end


  private
  def comment_params
    params.require(:comment).permit(:content, :image, :title, :rating)
  end
end
