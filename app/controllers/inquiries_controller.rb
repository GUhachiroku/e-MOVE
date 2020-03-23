class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      NotificationMailer.send_notification(@name, @email, @content).deliver_later
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
