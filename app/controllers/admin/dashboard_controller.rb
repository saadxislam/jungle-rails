class Admin::DashboardController < ApplicationController
  def show
    @total_product_count = Product.sum("quantity")
    @total_category_count = Category.select('id').uniq.length

  end
end
