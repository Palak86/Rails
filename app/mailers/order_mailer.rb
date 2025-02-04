class OrderMailer < ApplicationMailer
  default from: email_address_with_name("notification@example.com", "Example Company Notifications")

  def welcome_email
    @order = params[:order]
    @url  = "http://example.com/login"
    mail(to: email_address_with_name(@order.buyer.email, @order.buyer.name), subject: "Welcome to My Awesome Site")
  end
end
