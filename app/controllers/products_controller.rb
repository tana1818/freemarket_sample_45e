class ProductsController < ApplicationController

  require 'payjp'

  def show #商品詳細ページ
    set_product
    @comment = Comment.new
    @comments = Comment.where(product_id: params[:id])
    @other_user_products = Product.where(user_id: @product.user_id).where.not(id: params[:id]).order("id DESC").limit(6)
    @other_category_products = Product.where(brand: @product.brand).where.not(id: params[:id]).order("id DESC").limit(6)

    if user_signed_in?  #購入ボタンの表示の際に動く
    # @produc = Product.find(params[:id])
    else @no_user = User.none
    end

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

  def search  #商品検索ページ　（準備中）
  end

  def show_category_item  #全てのカテゴリ商品をみるボタン（準備中）
  end

  def show_brand_item  #全てのブランド商品をみるボタン（準備中）
  end

  def product_by_large_category(id)
    Product.where(large_category: id).order("id DESC").limit(4)
  end

  def product_by_brand_category(id)
    Product.where(brand: id).order("id DESC").limit(4)
  end

  def new
    @product = Product.new
    set_pulldowns
    gon.middle_category = ''
    gon.small_category = ''
    gon.product_images_count = 0
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: { message: 'success', productId: @product.id }, status: 200
    else
      render json: { error: @product.errors.full_messages.join(", ") }, status: 400
    end
  end

  def edit
    set_product
    set_pulldowns
    gon.product_id = params[:id]
    gon.product_images = @product.images
    gon.product_images_count = @product.images.length
    gon.middle_category = @product.middle_category
    gon.small_category = @product.small_category
    gon.size = @product.size.id
    gon.brand = @product.brand
  end

  def get_middle_categories
    render partial: 'middle_category', locals: {division: params[:large_category]}
  end

  def get_small_categories
    render partial: 'small_category', locals: {division: params[:middle_category]}
  end

  def judge_get_sizes
    set_small_category
    if @small_category.size_kind_id
      render partial: 'size', locals: {size_kind_id: @small_category.size_kind_id}
    end
  end

  def judge_brand
    set_small_category
    if @small_category.is_brand_presence
      render partial: 'brand'
    end
  end

  def pay
    Payjp.api_key = 'sk_test_eb4453d310b2f6b4f2c6f649'
    token = User.find(current_user.id).payjptoken
    #支払いの実行。amountは仮。
    amount = params[:amount]
    Payjp::Charge.create(
      amount:   amount,
      customer: token,
      currency: 'jpy'
    )
    redirect_to root_path
  end

  def destroy
    set_product
    @product.destroy if @product.user_id == curreent_user.id #とりあえずproductのuser_idが１なら商品消えるmerge後current_userに変更
  end

  def purchase_confirmation
    set_product
    # @delivery = Deliverie.find(user_id: current_user[:id])
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_small_category
    @small_category = Category.find(params[:small_category])
  end

  def set_pulldowns
    @large_categories = Category.where(division: :null).order('sort_by')
    @conditions = Condition.order('sort_by')
    @delivery_fee_pays = DeliveryFeePay.order('sort_by')
    @delivery_methods = DeliveryMethod.order('sort_by')
    @prefectures = Prefecture.all
    @shipment_periods = ShipmentPeriod.order('sort_by')
  end

  def product_params
    if params[:product][:images]
      params[:product][:images] = params[:product][:images].values
    end
    params.require(:product).permit(:name, :description, :large_category, :condition_id, :delivery_fee_pay_id, :delivery_method_id, :prefecture_id, :shipment_period_id, :price, {images: []}).merge(middle_category: params[:middle_category], small_category: params[:small_category], size_id: params[:size_id], brand: params[:brand], user_id: current_user.id, status: '出品中')
  end

  def comment_params
    params.require(:comment).permit(:comment, :product_id)
  end
end
