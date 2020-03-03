class MicropostsController < ApplicationController
  before_action :require_user_logged_in, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def index
    @micropost = current_user.microposts.build if logged_in?  # form_with 用
    @microposts = Micropost.order(id: :desc).search(params[:search]).page(params[:page]).per(10)
  end
  
  def new
    @micropost = Micropost.new
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "メッセージを投稿しました。"
      redirect_to root_url
    else 
      @microposts = current_user.microposts.order(id: :desc).page(params[:page])
      flash.now[:danger] = "メッセージの投稿に失敗しました。"
      render "toppages/index"
    end
  end
  
  def edit
    @micropost = Micropost.find_by(id: params[:id])
  end
    
  def update
    @micropost = Micropost.find_by(id: params[:id])
    if @micropost.update(micropost_params)
      flash[:success] = "メッセージは編集されました。"
      rederect_to @micropost
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
    params.require(:micropost).permit(:content)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  end
  
end
