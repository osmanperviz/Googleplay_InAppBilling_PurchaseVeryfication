require 'Googleplay_InAppBilling_PurchaseVeryfication'
class Railtie < Rails::Railtie

  rake_tasks do
    load 'tasks/play.rake'
  end


end