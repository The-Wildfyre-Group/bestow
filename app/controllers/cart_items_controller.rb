class CartItemsController < ApplicationController
  before_action :load_product

  def create
    respond_to do |format|
      format.json do
        if current_cart.add(@product,@product.price)
          render json: { status: :ok }
        else
          render json: { status: 200 }
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      format.json do
        if current_cart.remove(@product)
          render json: { status: :ok }
        else
          render json: { status: 200 }
        end
      end
    end
  end

  protected

  def load_product
    @product = Product.find(params[:product_id])
  end
end