class Client::ProductsController < ApplicationController
  def index
    response = Unirest.get("http://localhost:3000/api/products")
    @product = response.body
    render "index.html.erb"
  end  


  def show
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products#{product_id}")
    @product = response.body
    render "show.html.erb"
  end

  def new 
    render "new.html.erb"
  end

  def create
    response = Unirest.post("http://localhost:3000/api/products", parameters:
     {
      name: params[:input_name],
      price: params[:input_price],
      image_url: params[:input_image_url],
      description: params[:input_description]
    }
   )
  @product = response.body
  render "show.html.erb"
end

  def edit
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products#{product_id}")
    @product = response.body
    render "edit.html.erb"
 end

 def update
  product_id = params[:id]
  client_params = {
    name: params[:input_name],
    price: params[:input_price],
    image_url: params[:input_image_url],
    description: params[:input_description]
  }
  response = Unirest.patch("http://localhost:3000/api/products#{product_id}", parameters: client_params)
  @product = response.body
  render "show.html.erb"
 end

def destroy
  product_id = params[:id]
  response = Unirest.delete("localhost:3000/api/products#{product_id}")
  render "destroy.html.erb"
end
end
