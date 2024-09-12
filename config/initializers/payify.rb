Payify.setup do |config|
  config.currency = "usd"
  config.default_tax_rates_id = "txr_1234567890"
  config.stripe_secret_key = ENV["STRIPE_SECRET_KEY"]
  config.stripe_publishable_key = ENV["STRIPE_PUBLISHABLE_KEY"]
end
