  require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = 'pytdating'
    config.aws_acl    = 'public-read'
    config.aws_credentials = {
      access_key_id:     ENV['AW_KEY'],
      secret_access_key: ENV['AW_SECRET'],
      endpoint:'https://s3.us-east-1.amazonaws.com/pytdating/',
      region:            "us-east-1"
    }
  end
