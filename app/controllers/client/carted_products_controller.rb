class Client::CartedProductsController < ApplicationController
  def new
    render "new.html.erb"
  end

  def create
    response = Unirest.post('localhost:3000/api/carted_products',
      parameters: {
        user_
        product_id: params[:product_id],
        quantity: params[:quantity],
        status: params[:status],
      })
    carted_product = response.body
    render "show.html.erb"
    # redirect_to "/client/carted_products/#{carted_product['id']}"

  end
end
