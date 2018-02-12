class InstagramsController < ApplicationController
  before_action :set_Instagram, only:[:edit, :update, :destroy, :show]
  before_action :authenticate_user!
  
  def index
    @instagrams = Instagram.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    if params[:back]
      @Instagram = Instagram.new(instagrams_params)
    else
      @Instagram = Instagram.new
    end
  end

  def create
    ##Instagram.create(instagrams_params)
    @Instagram = Instagram.new(instagrams_params)
    @Instagram.user_id = current_user.id
    if @Instagram.save
      # ビューヘルパーの「rake routesのprefix_path」でルーティングにリンク
      redirect_to instagrams_path, notice: "画像を投稿しました"
      NoticeMailer.sendmail_instagram(@Instagram).deliver
    else
      render 'new' # newのViewへ(new.html.erb)
    end
  end

  def edit
    #@Instagram = Instagram.find(params[:id])
  end
  
  def show
    @comment = @Instagram.comments.build
    @comments = @Instagram.comments
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end
  
  def update
    if @Instagram.update(instagrams_params)
      redirect_to instagrams_path, notice: "ブログを編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    #@Instagram = Instagram.find(params[:id])
    @Instagram.destroy
    redirect_to instagrams_path, notice: "ブログを削除しました"
  end

  def confirm
    @Instagram = Instagram.new(instagrams_params)
    render :new if @Instagram.invalid? # if文1行書き 実行文 if 条件
  end

## ストロングパラメータ
## paramsメソッドにて取得した値の内、Instagramのtitleとcontentだけ取り込み
  private
   def instagrams_params
      params.require(:instagram).permit(:content, :image, :id, :user_id)
   end

   # idをキーとして値を取得するメソッド
   def set_Instagram
    @Instagram = Instagram.find(params[:id])
   end


end
