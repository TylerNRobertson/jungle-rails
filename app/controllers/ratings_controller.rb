class RatingsController < ApplicationController
  before_filter :redirect_guests
  def create

    @product = Product.find params[:product_id]
    @review = @product.ratings.new(review_params)
    @review.user = current_user
    if @review.save!
      redirect_to [@product], notice: 'Product created!'
    else
      redirect_to [@product], notice: 'Product created!'
    end
  end
  def destroy
    @product = Product.find params[:product_id]
    @review = Rating.find(params[:id])
    @review.destroy
    redirect_to [@product]
  end

  private

  def redirect_guests
    if session[:user_id] == nil
      redirect_to [@product], notice: 'Cant make a review whilst not logged in'
  end
end
  def review_params
    params.require(:rating).permit(
      :description,
      :rating
    )
  end

end
