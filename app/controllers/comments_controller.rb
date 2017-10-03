class CommentsController < ApplicationController
  before_action :set_comment, only:[:edit, :update, :destroy]

  # コメントの保存・投稿アクション
  def create
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog

    respond_to do |format|
      if @comment.save
        format.html{ redirect_to blog_path(@comment.blog), notice: 'コメントを投稿しました。'}
        flash[:notice] = "コメントを投稿しました。"
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @blog = @comment.blog
  end

  def update
    if @comment.update(comment_params)
      redirect_to blog_path(@comment.blog), notice: 'コメントを編集しました。'
    else
      render 'edit'
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html{ redirect_to blog_path(@comment.blog), notice: 'コメントを削除しました。'}
        flash[:notice] = "コメントを削除しました。"
        format.js { render :index }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
end
