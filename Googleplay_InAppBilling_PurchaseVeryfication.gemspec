# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Googleplay_InAppBilling_PurchaseVeryfication/version'

Gem::Specification.new do |spec|
  spec.name          = "Googleplay_InAppBilling_PurchaseVeryfication"
  spec.version       = GoogleplayInAppBillingPurchaseVeryfication::VERSION
  spec.authors       = ["Osman Perviz"]
  spec.email         = ["osmanperviz@gmail.com"]

  spec.summary       = %q{This(simple) gem handle Google Play In App Purchase Receipt Verification}
  spec.description   = %q{Some description}
  spec.homepage      = "https://github.com/osmanperviz/Googleplay_InAppBilling_PurchaseVeryfication"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "google-api-client"
  spec.add_runtime_dependency "rails"
end
