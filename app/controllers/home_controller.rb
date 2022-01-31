class HomeController < ApplicationController
  def index
    @categories = Category.all
    @marker = Marker.new
    @data = CategoryMarker.includes(:category, :marker)
    @types = Type.all
    @markers = Marker.all
  end

  
end
