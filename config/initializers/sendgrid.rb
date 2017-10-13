ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'zhengjiajun.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
