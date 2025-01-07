defmodule WineCellar do
  def explain_colors do
    # Please implement the explain_colors/0 function
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  # My implementation.
  #  def filter(cellar, color, opts \\ []) do
  #    wines = Keyword.get_values(cellar, color)
  #    year = Keyword.get(opts, :year)
  #    country = Keyword.get(opts, :country)
  #
  #    case {year, country} do
  #      {nil, nil} ->
  #        wines
  #
  #      {year, nil} ->
  #        wines |> filter_by_year(year)
  #
  #      {nil, country} ->
  #        wines |> filter_by_country(country)
  #
  #      {year, country} ->
  #        wines |> filter_by_year(year) |> filter_by_country(country)
  #    end
  #  end

  # The best community implementation.
  def filter(cellar, color, opts \\ []) do
    year = Keyword.get(opts, :year)
    country = Keyword.get(opts, :country)
    wines = Keyword.get_values(cellar, color)
    wines = if year, do: filter_by_year(wines, year), else: wines
    if country, do: filter_by_country(wines, country), else: wines
  end

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)

  defp filter_by_year([], _year) do
    IO.inspect(:first)
    []
  end

  defp filter_by_year([{_, year, _} = matched_wine | tail], year) do
    IO.inspect(:second)
    [matched_wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([_not_matched_wine | tail], year) do
    IO.inspect(:third)
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
