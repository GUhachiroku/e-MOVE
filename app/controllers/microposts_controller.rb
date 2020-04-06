class MicropostsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :edit, :destroy]
  before_action :correct_user, only: [:edit, :destroy]
  
  def index
    @rooms = Room.all
    @micropost = current_user.microposts.build if logged_in?
    @microposts = Micropost.order(id: :desc).search(params[:search]).page(params[:page]).per(20)
  end
  
  def new
    @rooms = Room.all
    @micropost = Micropost.new
  end
  
  def create
      @rooms = Room.all
      @room = Room.find(params[:room_id])
      @micropost = current_user.microposts.build(micropost_params)
      @micropost.room = @room 
      if @micropost.save
        flash[:success] = "メッセージを投稿しました。"
        redirect_to @room
      else 
        @microposts = current_user.microposts.order(id: :desc).page(params[:page])
        flash.now[:danger] = "メッセージの投稿に失敗しました。"
        render :new
      end
  end
  
  def edit
    @rooms = Room.all
    @micropost = Micropost.find(params[:id])
  end
    
  def update
    @rooms = Room.all
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      flash[:success] = "メッセージは編集されました。"
      redirect_to root_url
    else
      flash.now[:danger] = "メッセージは編集されませんでした。"
      render :edit
    end
  end
    
  def destroy
    @micropost.destroy
    flash[:success] = "メッセージを削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  
  private
  
  def micropost_params
    params.require(:micropost).permit(:content, :image)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  end
  
end
