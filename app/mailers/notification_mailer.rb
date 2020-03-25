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
end
