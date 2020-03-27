class NotificationMailer < ApplicationMailer
  default from: "hogehoge@example.com"

  def send_notification(name, email, content)
    @name = name
    @email = email
    @content = content
    mail(
      subject: "問い合わせがありました",
      to: "strikesweetbuet@gmail.com"
    ) do |format|
      format.text
    end
  end
  
  def send_inquiry_to_user(name, email, content)
    @name = name
    @email = email
    @content = content
    mail(
      subject: "お問い合わせ内容を送信しました。", #メールのタイトル
      to: @email #宛先
    ) do |format|
      format.text
    end
  end
end
