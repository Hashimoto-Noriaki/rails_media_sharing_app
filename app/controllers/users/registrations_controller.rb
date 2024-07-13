# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
    end
  end
end
