class Admin::ProductsController < Admin::ApplicationController
  
  def index
    @products = Product.all.order(id: :desc).page(params[:page]).per(20)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: 'Product was successful created'
    else
      flash[:alert] = 'Product was problem created'
    end
  end
  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    @product.traivan_id = current_traivan.id

    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Product was successful updated'
    else
      flash[:alert] = 'Product was problem updated'
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, notice: 'Product was successful delete'
  end

  def toggle_status
    @product = Product.find(params[:id])
    if @product.draft?
      @product.published!
    elsif @product.published?
      @product.draft!
    end

    redirect_to admin_products_url, notice: 'Status was successful updated'
  end

  private
    def product_params
      params.require(:product).permit(:title, :price, :description ,:status, photos_attributes: [:id ,:image , :_destroy])
    end
end
