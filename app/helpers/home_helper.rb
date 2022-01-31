module HomeHelper

  def marker_for_category(category)
    CategoryMarker.where('category_id = ?', category.id).all
  end
end
