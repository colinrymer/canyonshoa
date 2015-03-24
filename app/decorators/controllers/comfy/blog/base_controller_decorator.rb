Comfy::Blog::BaseController.class_eval do
  before_action :authenticate

  def authenticate
    unless current_user
      flash[:error] = "You must login to view this content."
      redirect_to new_user_session_path
    end
  end
end
