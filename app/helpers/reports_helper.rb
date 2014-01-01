module ReportsHelper
  def link_or_text(item)
    if item.class == Array
      link_to(item[0], item[1])
    else
      item
    end
  end
end
