defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    # Please implement the extract_from_path/2 function
    keys = String.split(path, ".")
    extract_from_keys(data, keys)
  end

  defp extract_from_keys(data, keys)
  defp extract_from_keys(data, []), do: data
  defp extract_from_keys(data, [first_key | rest]) do
    extract_from_keys(data[first_key], rest)
  end

  def get_in_path(data, path) do
    # Please implement the get_in_path/2 function
    keys = String.split(path, ".")
    get_in(data, keys)
  end
end
