class Auth::BaseController < ApplicationController
  before_filter :check_current_user

  def check_current_user
    redirect_to(root_path) if current_user
  end

end