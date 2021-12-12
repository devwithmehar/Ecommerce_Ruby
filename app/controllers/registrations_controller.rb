class RegistrationsController < ApplicationController
  private

  def sign_up_params
    params.require(:user).permit(:name, :address, :postalCode, :city, :email, :password, :password_confirmation,
                                 :province_id)
  end

  def account_update_params
    params.require(:user).permit(:name, :address, :postalCode, :city, :email, :password, :password_confirmation,
                                 :current_password, :province_id)
  end
end
