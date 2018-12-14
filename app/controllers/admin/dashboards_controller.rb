class Admin::DashboardsController < Admin::ApplicationController

  def index
    @products = Product.all.order(id: :desc).last(5)
    @products_published = Product.published.order(id: :desc).page(params[:page]).per(5)
    @products_draft = Product.draft.order(id: :desc).page(params[:page]).per(5)
  end
end
