class ProductsController < ApplicationController


  def show *商品詳細ページ
  end

  def index
    @products_womens = Product.where(large_categorie_id: 1).order("id DESC").limit(4)
    @products_mens = Product.where(large_categorie_id: 2).order("id DESC").limit(4)
    @products_kids = Product.where(large_categorie_id: 3).order("id DESC").limit(4)
    @products_perfumes = Product.where(large_categorie_id: 4).order("id DESC").limit(4)
    @products_chanels = Product.where(brand: "chanel").order("id DESC").limit(4)
    @products_vitons = Product.where(brand: "ルイヴィトン").order("id DESC").limit(4)
    @products_shups = Product.where(brand: "シュプリーム").order("id DESC").limit(4)
    @products_nikes = Product.where(brand: "NIKE").order("id DESC").limit(4)
  end

  def new
  end

  def search  #商品検索ページ　（準備中）
  end

  def show_category_item  #全てのカテゴリ商品をみるボタン（準備中）
  end

  def show_brand_item  #全てのブランド商品をみるボタン（準備中）
  end
  
end
