class Client::ProductsController < ApplicationController
  def index
    client_params = {
      search_name: params[:client_search_name],
      sort_by: params[:client_sort_by],
      category: params[:category]
    }
    response = Unirest.get("http://localhost:3000/api/products", parameters: client_params)
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
    @product = {}
    render "new.html.erb"
  end

  def create
    @product = {
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
      supplier_id: params[:supplier_id]
    }
    response = Unirest.post("localhost:3000/api/products", parameters: @product
     
   )
   
   if response.code == 200
     flash[:success] = "You created a new product"
     redirect_to "/client/products/"
   else
      @errors = response.body['errors']
      render "new.html.erb"
    end
  end

  def edit
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product = response.body
    render "edit.html.erb"
  end

  def update
    @product= {
     name: params[:name],
     price: params[:price],
     image_url: params[:image_url],
     description: params[:description]
    }
   response = Unirest.patch("http://localhost:3000/api/products/#{product_id}", parameters: @product)
    if response.code == 200
     flash[:success] = "You updated a product"
     redirect_to "/client/products/#{@product['id']}"
    else
     @errors = response.body['errors']
     render "edit.html.erb"
   end
  end

  def destroy
    product_id = params[:id]
    response = Unirest.delete("localhost:3000/api/products/#{product_id}")
    flash[:success] = "You deleted a product"
    redirect_to "/client/products"
  end
end
