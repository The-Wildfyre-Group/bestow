class Account::RegistriesController < Account::BaseController
  def show

  end
  
  private
    def registry_params
      params.require(:registry).permit(:title, :price)
    end
end