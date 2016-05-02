class Auth::SessionsController < Auth::BaseController
  skip_before_filter :check_current_user, only: :destroy

  def new
    redirect_to root_path and return if current_user
  end

  def create
    create_session(params) or render 'new'
  end

  def destroy
    logout
    redirect_to root_path
  end

  private

  def create_session(params)
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login(user)
      redirect_to root_path
    end
  end
end
