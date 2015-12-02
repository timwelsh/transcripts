Rails.configuration.stripe = {
  publishable_key: Rails.application.secrets.publishable_key,
  secret_key:      Rails.application.secrets.secret_key
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
STRIPE_PUBLIC_KEY = Rails.configuration.stripe[:publishable_key]
puts "Stripe API key: #{Stripe.api_key }"
