class RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
  end
  
  def show
    @rooms = Room.all
    @room = Room.find(params[:id])
    @micropost = @room.microposts.build
    @microposts = @room.microposts.order(id: :desc).page(params[:page])
  end
end
