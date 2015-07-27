Rails.configuration.stripe = {
  publishable_key: Rails.application.secrets.STRIPE_PUBLIC_KEY,
  secret_key:      Rails.application.secrets.STRIPE_API_KEY
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
STRIPE_PUBLIC_KEY = Rails.configuration.stripe[:publishable_key]
puts "Stripe API key: #{Stripe.api_key }"
