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

      if File.file?(secrets_path)
        secrets_config = YAML.load_file('config/secrets.yml')
        secrets_config[Rails.env].each do |key,value|
          if self.respond_to?(attribute)
           self.send("#{key}=",value)
          end
        end
      else
        play_config = YAML.load_file('config/google_play.yml')
        play_config[Rails.env].each do |key,value|
          if self.respond_to?(attribute)
            self.send("#{key}=",value)
          end
        end
      end

    end
  end
end


