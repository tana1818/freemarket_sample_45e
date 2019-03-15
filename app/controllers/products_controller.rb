class ProductsController < ApplicationController

  def show #商品詳細ページ
    @product = Product.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(product_id: params[:id])
    @other_user_products = Product.where(user_id: @product.user_id).order("id DESC").limit(6)
    @other_category_products = Product.where(brand: @product.brand).where.not(id: params[:id]).order("id DESC").limit(6)
  end

  def index #トップページ
    @products_womens = product_by_large_category(1)
    @products_mens = product_by_large_category(2)
    @products_kids = product_by_large_category(3)
    @products_perfumes = product_by_large_category(4)
    @products_chanels = product_by_brand_category("chanel")
    @products_vitons = product_by_brand_category("ルイヴィトン")
    @products_shups = product_by_brand_category("シュプリーム")
    @products_nikes = product_by_brand_category("NIKE")
  end

  def new
  end

  def search  #商品検索ページ　（準備中）
  end

  def show_category_item  #全てのカテゴリ商品をみるボタン（準備中）
  end

  def show_brand_item  #全てのブランド商品をみるボタン（準備中）
  end

  def product_by_large_category(id)
    Product.where(large_categorie_id: id).order("id DESC").limit(4)
  end

  def product_by_brand_category(id)
    Product.where(brand: id).order("id DESC").limit(4)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :product_id)
  end

end
