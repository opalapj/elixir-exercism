defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    # Please implement the sort_by_price/1 function
    Enum.sort_by(inventory, fn x -> x.price end)
  end

  def with_missing_price(inventory) do
    # Please implement the with_missing_price/1 function
    Enum.filter(inventory, fn x -> is_nil(x.price) end)
  end

  def update_names(inventory, old_word, new_word) do
    # Please implement the update_names/3 function
    Enum.map(
      inventory,
      fn i ->
        name = String.replace(i.name, old_word, new_word)
        %{i | name: name}
      end
    )
  end

  def increase_quantity(item, count) do
    # Please implement the increase_quantity/2 function
    quantities =
      Map.new(
        item.quantity_by_size,
        fn {size, quantity} -> {size, quantity + count} end
      )

    %{item | quantity_by_size: quantities}
  end

  def total_quantity(item) do
    # Please implement the total_quantity/1 function
    Enum.reduce(
      item.quantity_by_size,
      0,
      fn {_size, quantity}, acc -> acc + quantity end
    )
  end
end
