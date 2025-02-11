class OrderWelcomeEmailJob < ApplicationJob
  queue_as :default

  def perform(order)
    OrderMailer.with(order: order).welcome_email.deliver_now
  end
end
