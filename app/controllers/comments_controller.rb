class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.post_id = params[:post_id]

    if comment.save
      redirect_to posts_path, success: '口コミを投稿しました'
    else
      flash.now[:danger] = '口コミを投稿できませんでした'
      render :new
    end
  end
end
