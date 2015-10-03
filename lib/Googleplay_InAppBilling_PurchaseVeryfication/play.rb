require 'google/api_client'
require 'openssl'
module GoogleplayInAppBillingPurchaseVeryfication
  class Play

    def self.google_api_client
      config = Config.new
      @@google_client ||= Google::APIClient.new(
          auto_refresh_token:  true,
          application_name:    config.app_name,
          application_version: config.app_version
      ).tap do |client|

        client.authorization = Signet::OAuth2::Client.new(
            :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
            :refresh_token => config.refresh_token,
            :client_id => config.client_id,
            :client_secret => config.google_secret
        )
        client.authorization.fetch_access_token!
      end
    end

      def self.verify(package_name, subscription_id, purchase_token)
        client = self.google_api_client
        subscription = client.discovered_api('androidpublisher', 'v2')
        api_method = subscription.purchases.products.get
        purchases = client.execute(api_method: api_method, parameters: {
                                                             "packageName"    => package_name,
                                                             "productId"      => subscription_id,
                                                             "token"          => purchase_token
                                                         }).data

      end

  end
end

