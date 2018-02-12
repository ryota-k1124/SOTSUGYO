class UsersController < ApplicationController
  before_action :set_users, only:[:show]
  
  def index
    @users = User.all
  end
  
  def show
    @users = User.all
  end
  
  private
   def users_params
      params.require(:uesr).permit(:email, :name, :avatar, :image_url, :id)
   end

   # idをキーとして値を取得するメソッド
   def set_users
    @user = User.find(params[:id])
   end
end
