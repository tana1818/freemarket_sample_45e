class ProductsController < ApplicationController

  def show *商品詳細ページ
  end

  def new
    @product = Product.new
    @conditions = Condition.order('sort_by')
    @delivery_fee_pays = DeliveryFeePay.order('sort_by')
    @delivery_methods = DeliveryMethod.order('sort_by')
    @prefectures = Prefecture.all
    @shipment_periods = ShipmentPeriod.order('sort_by')
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: { message: 'success', productId: @product.id }, status: 200
    else
      render json: { error: @product.errors.full_messages.join(", ") }, status: 400
    end
  end

  def get_middle_categories
    render partial: 'middle_category', locals: {division: params[:large_category]}
  end

  def get_small_categories
    render partial: 'small_category', locals: {division: params[:middle_category]}
  end

  def judge_get_sizes
    @small_category = Category.find(params[:small_category])
    if @small_category.size_kind_id
      render partial: 'size', locals: {size_kind_id: @small_category.size_kind_id}
    end
  end

  def judge_brand
    @small_category = Category.find(params[:small_category])
    if @small_category.is_brand_presence
      render partial: 'brand'
    end
  end


  private

  def product_params
    if params[:product][:images]
      params[:product][:images] = params[:product][:images].values
    end
    params.require(:product).permit(:name, :description, :condition_id, :delivery_fee_pay_id, :delivery_method_id, :prefecture_id, :shipment_period_id, :price, {images: []}).merge(small_category: params[:small_category], size_id: params[:size_id], brand: params[:brand], user_id: 1, status: '出品中')
  end

end
