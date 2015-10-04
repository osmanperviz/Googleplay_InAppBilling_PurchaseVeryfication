# GoogleplayInAppBillingPurchaseVeryfication

This(simple) gem handle Google Play In App Purchase Receipt Verification, and retrieving the information associated with receipt data.
Server-side verification over SSL is the most reliable way to determine the authenticity of purchasing records.
## Installation

Add this line to your application's Gemfile:


    gem 'Googleplay_InAppBilling_PurchaseVeryfication'


And then execute:

     $ bundle

Or install it yourself as:

    $ gem install Googleplay_InAppBilling_PurchaseVeryfication

## Usage

   For this game you need to provide the following credentials:
           * client_id
           * google_secret
           * refresh_token
           * app_name
           * app_version

## Rails version greater than 4.1

   Credentials will be placed in the  secrets.yml  file


## Rails version less than 4.1

   Just run "rake play_config" command  will generate under AppRoot/config google_play.yml file.
   Credentials will be placed in this file.


  ## SIMPLE USAGE

       receipt_data = 'base64 string from android app'
       response = GoogleplayInAppBillingPurchaseVeryfication::Play.verify(package_name, subscription_id, receipt_data)
       if response
        success
       else
        error
       end
       rescue Exception => e
          render json: {:message=> e.message},status: 400


## Contributing

* Fork the project.

* Make your feature addition or bug fix.

* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)

## Details

Need more detail on how all of this works (especially the Android implementation)? Read Google's In-app Billing Docs.


## Error




## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

