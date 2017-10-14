ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => ENV['sendgrid_password'],
  :domain => 'zhengjiajun.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
