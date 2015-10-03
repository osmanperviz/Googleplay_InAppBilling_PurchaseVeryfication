module GoogleplayInAppBillingPurchaseVeryfication
  class FileError < StandardError; end
  class Config
    attr_reader :app_name,:app_version,:refresh_token,:google_secret,:client_id

    def initialize
      play_path = File.join(Rails.root, "config", "google_play.yml")
      secrets_path = File.join(Rails.root, "config", "secrets.yml")

      if !File.file?(play_path) && !File.file?(secrets_path)
        raise FileError,'Missing Config File(secrets.yml or google_play.yml)'
      end
      custum_config = File.file?(play_path) ?  YAML.load_file('config/google_play.yml') :  Hash.new{ |hash, key| hash[key] = {} }
      secrets_config = File.file?(secrets_path) ?  YAML.load_file('config/secrets.yml') :  Hash.new{ |hash, key| hash[key] = {} }

      @app_name = secrets_config[Rails.env]['app_name'] || custum_config[Rails.env]['app_name']
      @app_version = secrets_config[Rails.env]['app_version'] || custum_config[Rails.env]['app_version']
      @refresh_token = secrets_config[Rails.env]['refresh_token'] || custum_config[Rails.env]['refresh_token']
      @google_secret = secrets_config[Rails.env]['google_secret'] || custum_config[Rails.env]['google_secret']
      @client_id = secrets_config[Rails.env]['client_id'] || custum_config[Rails.env]['client_id']
    end

  end
end

