CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = "jayzen" #操作员名称
  config.upyun_password = ENV['ypyun_password'] #操作员密码
  config.upyun_bucket = "jayson" #服务名称
  config.upyun_bucket_host = "https://test.zhengjiajun.com"
end
