class Account::RegistryProductsController < Account::BaseController
  defaults :resource_class => RegistryProduct

  belongs_to :product, :registry, optional: true

  def create
    create! do |success, failure|
      success.html{ redirect_to account_registry_path(resource.registry) }
    end
  end

  protected

    def registry_product_params
      params.require(:registry_product).permit(:product_id, :registry_id)
    end
end