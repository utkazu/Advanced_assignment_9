ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.mail.yahoo.co.jp',
  domain: 'yahoo.co.jp',
  port: 465,
  user_name: ENV['YAHOO_USER_NAME'],
  password: ENV['YAHOO_PASSWORD'],
  authentication: :plain,
  enable_starttls_auto: true,
  ssl: true
}
