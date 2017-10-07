class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
    @conversations = Conversation.all
  end

  def create
    # 該当ユーザ間で過去の会話が存在しているか
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      # 過去の会話を取得
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      # 過去の会話がなかったら、メッセージを作成
      @conversation = Conversation.create!(conversation_params)
    end

    # メッセージ一覧画面へ遷移
    redirect_to conversation_messages_path(@conversation)
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
end
