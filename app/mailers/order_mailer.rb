class OrderMailer < ApplicationMailer
  default from: email_address_with_name("notification@example.com", "Example Company Notifications")
  # before_action :set_user

  def welcome_email
    @order = params[:order]
    @url  = "http://example.com/login"
    # attachments.inline["lion.jpg"] = File.read("public/lion.jpg")    
    # attachments["lion.jpg"] = File.read("public/lion.jpg")
    # users = User.all
    # mail(to: email_address_with_name("patelpalak2517@gmail.com", "palak"), subject: "Welcome to My Awesome Site")
    mail(to: email_address_with_name(@order.buyer.email, @order.buyer.name), subject: "Welcome to My Awesome Site")

  end


  private
    # def set_user
    #   @user = params[:current_user]
    # end
end
