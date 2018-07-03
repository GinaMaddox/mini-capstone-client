class Client::ProductsController < ApplicationController
  def index
    response = Unirest.get("http://localhost:3000/api/products")
    @products = response.body
    render "index.html.erb"
  end  


  def show
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products#{product_id}")
    @products = response.body
    render "show.html.erb"
  end

  # def new 
end
