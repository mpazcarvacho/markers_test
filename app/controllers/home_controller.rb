class HomeController < ApplicationController
  def index
    # DONE only display public categories
    @categories = Category.where('private = ?', false)
    @marker = Marker.new
    @data = CategoryMarker.includes(:category, :marker)
    @types = Type.all
    @markers = Marker.all

  end
  
  def chart
    @markers_per_category = CategoryMarker.group(:category_id).count.map{|c| [Category.find(c[0]).name, c[1]]}
  end

  
end
