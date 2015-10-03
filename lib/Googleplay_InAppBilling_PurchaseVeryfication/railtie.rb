require 'Googleplay_InAppBilling_PurchaseVeryfication'
module GoogleplayInAppBillingPurchaseVeryfication
  class Railtie < Rails::Railtie
    railtie_name :GoogleplayInAppBillingPurchaseVeryfication
    rake_tasks do
      load 'tasks/play.rake'
    end
  end
end