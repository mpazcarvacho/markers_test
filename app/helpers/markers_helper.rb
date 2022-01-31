module MarkersHelper

  def categories_for_select
    Category.order(:name).collect{|c| [c.name, c.id]}
  end
end
