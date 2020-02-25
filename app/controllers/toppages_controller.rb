class ToppagesController < ApplicationController
  def index
    
      # @micropost = current_user.microposts.build  # form_with 用
      @microposts = Micropost.order(id: :desc).page(params[:page])
   
  end
end
