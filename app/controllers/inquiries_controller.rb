class InquiriesController < ApplicationController
  def new
    @rooms = Room.all
    @inquiry = Inquiry.new
  end

  def create
    @rooms = Room.all
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      NotificationMailer.send_notification(@inquiry.name, @inquiry.email, @inquiry.content).deliver_later
      NotificationMailer.send_inquiry_to_user(@inquiry.name, @inquiry.email, @inquiry.content).deliver
      flash[:success] = "お問い合わせの送信に成功しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "お問い合わせの送信に失敗しました。。"
      render :new
    end
  end
  
  private
  
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :content)
  end
end
