class RegistrationsController < Devise::RegistrationsController
private

  def sign_up_params
    binding.irb
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :role)
  end
end
