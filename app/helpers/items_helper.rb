module ItemsHelper

  def converting_to_mark(price)
    "¥#{price.to_s(:delimited)}"
  end
end
