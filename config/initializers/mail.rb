ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: 'strikesweetbuet@gmail.com',
  password: 'pqdyoswcpthvzedz',
  enable_starttls_auto: true
}