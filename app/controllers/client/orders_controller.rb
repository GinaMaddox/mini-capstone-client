class Client::OrdersController < ApplicationController

  def show
    #get data from API and show to user
    order_id = params[:id]
    response = Unirest.get("localhost:3000/api/orders/#{order_id}")
    @order = response.body
    render "show.html.erb"
  end



  def create
    #make request to API to grab the new order
    #(remember! order form tags are now on product/show.html.erb page ) 
    #and show to user 
    response = Unirest.post('localhost:3000/api/orders',
      parameters: {
        product_id: params[:product_id],
        quantity: params[:quantity]
      })
    order = response.body
    redirect_to "/client/orders/#{order['id']}"
  end
end
