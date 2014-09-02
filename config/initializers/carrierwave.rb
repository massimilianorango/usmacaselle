CarrierWave.configure do |config|
  config.ftp_host = ENV['FTP_HOST']
  config.ftp_port = ENV['FTP_PORT']
  config.ftp_user = ENV['FTP_USER']
  config.ftp_passwd = ENV['FTP_PASSWD']
  config.ftp_folder = ENV['FTP_FOLDER']
  config.ftp_url = ENV['FTP_URL']
  config.ftp_passive = true # false by default
end