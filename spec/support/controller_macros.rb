module ControllerMacros
  def login_buyer(buyer)

    @request.env["devise.mapping"] = Devise.mappings[:buyer]
    sign_in buyer
  end
end