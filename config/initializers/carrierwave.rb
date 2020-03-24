require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
 
CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'proj-image-store'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AKIAWH4TCL6IVTTGQPVI'],
      aws_secret_access_key: ENV['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'],
      region: ENV['ap-northeast-1'],
      path_style: true
    }
  end
end
 
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/