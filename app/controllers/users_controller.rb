class UsersController < ApplicationController
  # before_action :require_user_logged_in, only: [:index, :show]
  def index
    @users = User.order(id: :desc).page(params[:page]).per(20)
  end

  def show
    @rooms = Room.all
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(id: :desc).page(params[:page])
    counts(@user)
  end

  def new
    @rooms = Room.all
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      
      flash[:success] = "ユーザー登録しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "ユーザーの登録に失敗しました。"
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールは編集されました。"
      redirect_to @user
    else
      flash.now[:danger] = "プロフィールは編集されませんでした。"
      render :edit
    end
  end
  
  

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :self_introduction, :image)
  end
  
  
end
