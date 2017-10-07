class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    # 会話に紐づくメッセージを取得
    @messages = @conversation.messages

    # メッセージの件数が１０件より多い場合
    if @messages.length > 10
      # １０件越えフラグを有効にし、最新のメッセージ（１〜１０件）を取得
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    # 上記以外の場合、１０件越えフラグを向こうにし、会話に紐づくメッセージを全て取得
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    # メッセージが最新の場合、以下の処理を行う
    if @messages.last
      # 最新メッセージのユーザが自ユーザでない場合、メッセージ既読フラグを有効にする
      if @messages.last.user_id != current_user.id
        @messages.last.read = true
      end
    end

    # 新規投稿のメッセージ用の変数を作成
    @message = @conversation.messages.build
  end

  def create
    # HTTPリクエスト上のパラメータを用いて会話に紐づくメッセージを生成
    @message = @conversation.messages.build(message_params)

    # 生成したメッセージが保存できた場合、会話に紐づくメッセージ一覧画面に遷移
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end
end
