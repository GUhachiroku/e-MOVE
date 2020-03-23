class RoomsController < ApplicationController
  
  def index
    @rooms = Room.order(id: :desc).page(params[:page]).per(20)
  end
  
  def show
    @room = Room.find(params[:id])
    @microposts = @room.microposts.order(id: :desc).page(params[:page])
  end
end
