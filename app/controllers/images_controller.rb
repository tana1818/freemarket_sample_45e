class ImagesController < ApplicationController
  before_action :set_product

  def create
    Product.transaction do
      add_more_images(images_params[:images])
      @product.save!
      if params[:image_num]
        remove_image_at_index(params[:image_num])
        @product.save!
      end
      @product.update(name: product_params[:name], description: product_params[:description], large_category: product_params[:large_category], condition_id: product_params[:condition_id], delivery_fee_pay_id: product_params[:delivery_fee_pay_id], delivery_method_id: product_params[:delivery_method_id], prefecture_id: product_params[:prefecture_id], shipment_period_id: product_params[:shipment_period_id], price: product_params[:price], middle_category: params[:middle_category], small_category: params[:small_category], size_id: params[:size_id], brand: params[:brand])
    end
      render json: { message: 'success', productId: @product.id , act: 'update'}, status: 200
    rescue => e
      render json: { error: e.message }, status: 400
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    if @product.save
      redirect_to edit_product_path(@product)
    else
      render json: { error: @product.errors.full_messages.join(", ") }, status: 400
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def add_more_images(new_images)
    images = @product.images
    images += new_images
    @product.images = images
  end

  def remove_image_at_index(del_images_num)
    del_images = []
    del_images = del_images_num.split(',')
    del_images.sort!
    index = 0
    del_images.each do |del_image|
      image_number = del_image.to_i
      image_number -= index
      remain_images = @product.images
      if image_number == 0 && @product.images.size == 1
        @product.remove_images!
      else
        deleted_image = remain_images.delete_at(image_number)
        deleted_image.try(:remove!)
        @product.images = remain_images
      end
      index += 1
    end
  end

  def images_params
    if params[:product][:images]
      params[:product][:images] = params[:product][:images].values
    end
    params.require(:product).permit({images: []})
  end

  def product_params
    params.require(:product).permit(:name, :description, :large_category, :condition_id, :delivery_fee_pay_id, :delivery_method_id, :prefecture_id, :shipment_period_id, :price).merge(middle_category: params[:middle_category], small_category: params[:small_category], size_id: params[:size_id], brand: params[:brand], user_id: current_user.id, status: '出品中')
  end
end
