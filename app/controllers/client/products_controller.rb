class Client::ProductsController < ApplicationController
  def index
    user_input = params[:client_search]
    response = Unirest.get("http://localhost:3000/api/products", parameters: {search: user_input})
    @products = response.body
    render "index.html.erb"
  end  


  def show
    product_id = params[:id] #id params from routes
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product = response.body
    render "show.html.erb"
  end

  def new 
    render "new.html.erb"
  end

  def create
    response = Unirest.post("localhost:3000/api/products", parameters:
     {
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
      supplier_id: params[:supplier_id]
    }
   )
   @product = response.body
   flash[:success] = "You created a new product"
   redirect_to "/client/products/#{@product['id']}"
  end

  def edit
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product = response.body
    render "edit.html.erb"
  end

  def update
    product_id = params[:id]
    client_params = {
     name: params[:name],
     price: params[:price],
     image_url: params[:image_url],
     description: params[:description]
    }
   response = Unirest.patch("http://localhost:3000/api/products#{product_id}", parameters: client_params)
   @product = response.body
   flash[:success] = "You updated a product"
   redirect_to "/client/products/#{@product['id']}"
  end

  def destroy
    product_id = params[:id]
    response = Unirest.delete("localhost:3000/api/products/#{product_id}")
    flash[:danger] = "You deleted a product"
    redirect_to "/client/products"
  end
end
