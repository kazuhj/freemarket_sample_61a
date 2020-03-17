require 'active_support/core_ext/numeric/conversions'
module ItemsHelper

  def converting_to_mark(price)
    "¥ #{@item.price.to_s(:delimited)}"
  end
end