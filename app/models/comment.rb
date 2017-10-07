class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  has_many :notifications, dependent: :destroy

  def execute_Pusher(blog_user_id)
    unless blog_user_id == current_user.id
      Pusher.trigger("user_#{blog_user_id}_channel", 'comment_created', {
        message: 'あなたの作成したブログにコメントが付きました'
      })
    end
  end


end
