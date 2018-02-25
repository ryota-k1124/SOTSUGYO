class MenusController < ApplicationController
  before_action :set_Menu, only:[:edit, :update, :destroy, :show]
  before_action :authenticate_user!
  #before_action :taste_params, only:[:index]
  def index
    @menus = Menu.search(menus_params[:taste])

    respond_to do |format|
      format.html
      format.js
    end
    #@binding.pry
  end

  def new
    if params[:back]
      @Menu = Menu.new(menus_params)
    else
      @Menu = Menu.new
    end
  end

  def create
    ##Menu.create(menus_params)
    @Menu = Menu.new(menus_params)
    @Menu.user_id = current_user.id
    if @Menu.save
      # ビューヘルパーの「rake routesのprefix_path」でルーティングにリンク
      redirect_to tops_path, notice: "画像を投稿しました"
      NoticeMailer.sendmail_menu(@Menu).deliver
    else
      render 'new' # newのViewへ(new.html.erb)
    end
  end

  def edit
    @taste = @Menu.taste
    #@Menu = Menu.find(params[:id])
  end
  
  def show
    @comment = @Menu.comments.build
    @comments = @Menu.comments
    @taste = @Menu.taste
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end
  
  def update
    if @Menu.update(menus_params)
      redirect_to tops_path, notice: "投稿を編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    #@Menu = Menu.find(params[:id])
    @Menu.destroy
    redirect_to tops_path, notice: "投稿を削除しました"
  end

  def confirm
    @Menu = Menu.new(menus_params)
    render :new if @Menu.invalid? # if文1行書き 実行文 if 条件
  end

## ストロングパラメータ
## paramsメソッドにて取得した値の内、Menuのtitleとcontentだけ取り込み
  private
   def menus_params
      params.require(:menu).permit(:content, :image, :checkbox, :id, :user_id, taste: [])
   end

   # idをキーとして値を取得するメソッド
   def set_Menu
    @Menu = Menu.find(params[:id])
   end


end
