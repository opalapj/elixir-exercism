defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    # Please implement the get_volume/1 function
    elem(volume_pair, 1)
  end

  def to_milliliter({:cup, volume}) do
    # Please implement the to_milliliter/1 functions
    {:milliliter, volume * 240}
  end

  def to_milliliter({:fluid_ounce, volume}) do
    # Please implement the to_milliliter/1 functions
    {:milliliter, volume * 30}
  end

  def to_milliliter({:teaspoon, volume}) do
    # Please implement the to_milliliter/1 functions
    {:milliliter, volume * 5}
  end

  def to_milliliter({:tablespoon, volume}) do
    # Please implement the to_milliliter/1 functions
    {:milliliter, volume * 15}
  end

  def to_milliliter({:milliliter, volume}) do
    # Please implement the to_milliliter/1 functions
    {:milliliter, volume}
  end

  def from_milliliter(volume_pair, :cup) do
    # Please implement the from_milliliter/2 functions
    {:cup, elem(volume_pair, 1) / 240}
  end

  def from_milliliter(volume_pair, :fluid_ounce) do
    # Please implement the from_milliliter/2 functions
    {:fluid_ounce, elem(volume_pair, 1) / 30}
  end

  def from_milliliter(volume_pair, :teaspoon) do
    # Please implement the from_milliliter/2 functions
    {:teaspoon, elem(volume_pair, 1) / 5}
  end

  def from_milliliter(volume_pair, :tablespoon) do
    # Please implement the from_milliliter/2 functions
    {:tablespoon, elem(volume_pair, 1) / 15}
  end

  def from_milliliter(volume_pair, :milliliter) do
    # Please implement the from_milliliter/2 functions
    {:milliliter, elem(volume_pair, 1)}
  end

  def convert(volume_pair, unit) do
    # Please implement the convert/2 function
    mls = elem(to_milliliter(volume_pair), 1)
    from_milliliter({:milliliter, mls}, unit)
  end
end
