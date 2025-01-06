defmodule Username do
  @moduledoc """
  Create sanitized aliases for all email accounts.
  """

  # ä becomes ae
  # ö becomes oe
  # ü becomes ue
  # ß becomes ss

  @doc """
  Sanitize existing usernames by removing everything but lowercase letters.
  Allow underscores.
  Substitute German characters.
  """
  @spec sanitize(charlist) :: charlist
  def sanitize(username)
  def sanitize([]), do: []

  def sanitize([head | tail]) do
    result =
      case head do
        x when (x >= ?a and x <= ?z) or x == ?_ -> [x]
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        _ -> ~c""
      end

    result ++ sanitize(tail)
  end
end
