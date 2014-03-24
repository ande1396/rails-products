class ProductsController < ApplicationController
  def index
    @products = Product.all 
    @comments = Comment.all
    #not sure if i need this comments part
  end

  def show
    @product = Product.find(params[:id])

    @comment = @product.comments.new

    #if you do .comment.new it will just be a standalone product
    #check in the command line

    #making a comment connected to this product
    @comments = @product.comments.all

    #again, idk if this is correct ^ ####

  end

  def new
    @product = Product.new

    #this goes to the new.html, as you will see for simple_form_for @product 

    #this is for a temporay object 
    #if you don't want to save it 
    #########need this explained a little more ############### eylem explained to me on my notes
  end

  def edit
    @product = Product.find(params[:id])
    #can maybe do, like below, Product was updated,with if and else statements 
  end

  def create
    puts "AAAAAAAAAAAAAAAAAAAAAA"
    puts params
    puts "AAAAAAAAAAAAAAAAAAAAAA"

    @product = Product.new(product_params)
    ######## is there a way to tesdt this before below #### it went through it the command line -> you have to do the @product.save
    if @product.save
      redirect_to @product, notice: "Product was made"
    else
      puts "NOOOOOOOOOOOOOOOOOOOO"
      puts @product.errors.full_messages 
      puts "NOOOOOOOOOOOOOOOOOOOO"
      # redirect_to :back, flash: { errors: @product.errors.full_messages }
      render :new
    end
  end

  def update
    @product = Product.update(params[:id], product_params)
    # redirect_to @product
    if @product.save
      redirect_to @product, notice: "Product was updated"
    else
      redirect_to :back,  flash: { errors: @product.errors.full_messages }
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
    #redirect to the index page 

  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :pricing, :category_id)
    end
end
