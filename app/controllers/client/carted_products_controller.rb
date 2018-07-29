class Client::CartedProductsController < ApplicationController
  
  def index
    response = Unirest.get("localhost:3000/api/carted_products")
    @carted_products = response.body
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    response = Unirest.post('localhost:3000/api/carted_products',
      parameters: {
        product_id: params[:product_id],
        quantity: params[:quantity]
      })
    @carted_product = response.body
    # render "show.html.erb"
    redirect_to "/client/carted_products/"

  end
end
