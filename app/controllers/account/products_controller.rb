class Account::ProductsController < Account::BaseController
  private
    def product_params
      params.require(:product).permit(:title, :price)
    end
end