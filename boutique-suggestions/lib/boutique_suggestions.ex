defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    # Please implement the get_combinations/3 function

    # My solution for price option.
#    price = case options do
#      [maximum_price: price] -> price
#      _ -> 100
#    end

    # The best solution for price option.
    price = Keyword.get(options, :maximum_price, 100)

    for top <- tops,
        bottom <- bottoms,
        top.base_color != bottom.base_color,
        (top.price + bottom.price) < price
    do
        {top, bottom}
    end
  end
end
