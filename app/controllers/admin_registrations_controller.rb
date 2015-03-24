class AdminRegistrationsController < Devise::RegistrationsController
  def new
    flash[:error] = 'Registrations are not open.'
    redirect_to root_url
  end

  def create
    flash[:error] = 'Registrations are not open.'
    redirect_to root_url
  end
end
