defmodule HighSchoolSweetheart do
  def first_letter(name) do
    # Please implement the first_letter/1 function
    name
    |> String.trim()
    |> String.first()
  end

  def initial(name) do
    # Please implement the initial/1 function
    name
    |> first_letter()
    |> String.upcase()
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    # Please implement the initials/1 function
    [fname, lname] = String.split(full_name, " ")
    initial(fname) <> " " <> initial(lname)
  end

  def pair(full_name1, full_name2) do
    # Please implement the pair/2 function
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(full_name1)}  +  #{initials(full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
